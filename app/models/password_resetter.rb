class PasswordResetter

  def self.messages
    {
      success: %{ We sent you an email with instructions for
        resetting your password.}.squish,
      manager_not_found: %{ Unable to log you in. Please check your email
        and password and try again.}.squish,
      mail_failed: "Unable to send email. Please notify the webmaster.",
      save_failed: "Password reset failed. Please notify the webmaster."
    }
  end

  def initialize(flash)
    @flash = flash
  end

  def set_reset_code_and_notify_manager(email)
    @manager = Manager.find_by( email: email )

    if !@manager
      @flash.now[:alert] = PasswordResetter.messages[:manager_not_found]
    elsif @manager.set_password_reset_code
      send_password_reset_coded_link
    else
      @flash.now[:alert] = PasswordResetter.messages[:save_failed]
    end
  end

  def update_password(manager, manager_params)
    if manager.reset_password( manager_params )
      begin
        ManagerNotifier.password_was_reset( manager ).deliver
      rescue
        @flash[:alert] = PasswordResetter.messages[:mail_failed]
      end

      return true
    end
  end

  private

  def send_password_reset_coded_link
    begin
      ManagerNotifier.coded_password_reset_link(@manager).deliver

      @flash[:notice] = PasswordResetter.messages[:success]
    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
      @flash[:alert] = PasswordResetter.messages[:mail_failed]
    end
  end
end
