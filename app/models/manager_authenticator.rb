class ManagerAuthenticator

  def self.messages
    {
      auth_failed: %{
        Unable to log you in.
        Please check your email and password and try again.
      }.squish
    }
  end

  def initialize(flash)
    @flash = flash
  end

  def authenticate_manager(manager_params)
    unless manager = Manager.authenticate(
        manager_params[:email].downcase,
        manager_params[:password]
      )

      @flash[:alert] = ManagerAuthenticator.messages[:auth_failed]
    end

    manager
  end
end
