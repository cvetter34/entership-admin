class ManagerNotifier < ActionMailer::Base
  default from: "EnterShip <info@entership.net>"

  CODED_RESET_LINK          = "[EnterManager] Reset your credentials"
  PASSWORD_WAS_RESET        = "[EnterManager] Your password has been reset!"
  WELCOME_NEW_MANAGER       = "[EnterManager] Welcome! Please set your credentials"

  def coded_password_reset_link(manager)
    @manager = manager

    mail to: @manager.email, subject: CODED_RESET_LINK
  end

  def password_was_reset(manager)
    @manager = manager

    mail to: @manager.email, subject: PASSWORD_WAS_RESET
  end

  def welcome_new_manager(manager)
    @manager = manager

    mail to: @manager.email, subject: WELCOME_NEW_MANAGER
  end
end
