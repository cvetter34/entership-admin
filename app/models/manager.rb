class Manager < ActiveRecord::Base

  default_scope { order(is_director: :desc) }

  TIME_TO_COMPLETE_PASSWORD_RESET = 1.day

  attr_accessor :password, :password_confirmation

  before_create :set_random_password, unless: :password
  before_save :encrypt_password, if: :password
  before_save :downcase_attributes

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

  def self.nullify_expired_password_reset_codes
    Manager.where(
      "password_reset_expires_at < ?", Time.now.gmtime
    ).update_all(
      "password_reset_code = NULL, password_reset_expires_at = NULL"
    )
  end

  def self.find_by_code(code)
    Manager.nullify_expired_password_reset_codes

    if manager = Manager.find_by(
        "password_reset_code = ? AND password_reset_expires_at >= ?",
        code, Time.now.gmtime
      )
      manager.set_password_reset_expiration
    end

    manager
  end

  def self.authenticate(email, password)
    manager = Manager.find_by email: email.downcase
    manager if manager and manager.authenticate(password)
  end

  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  def set_password_reset_code
    self.password_reset_code = SecureRandom.urlsafe_base64
    set_password_reset_expiration
  end

  def set_password_reset_expiration
    self.password_reset_expires_at = TIME_TO_COMPLETE_PASSWORD_RESET.from_now
    self.save
  end

  def reset_password(manager_params)
    if manager_params[:password].blank?
      self.errors.add :password, "can't be blank"
      return false
    else
      self.update_attributes(
        password_reset_code: nil,
        password_reset_expires_at: nil
      )
    end
  end

  private

  def downcase_attributes
    self.email.downcase!
  end

  def set_salt
    self.salt = BCrypt::Engine.generate_salt
  end

  def encrypt_password
    self.fish = BCrypt::Engine.hash_secret(password, set_salt)
  end

  def set_random_password
    if self.fish.blank?
      self.fish = BCrypt::Engine.hash_secret(SecureRandom.base64(32), set_salt)
    end
  end
end
