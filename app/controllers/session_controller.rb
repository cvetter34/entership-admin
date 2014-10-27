class SessionController < ApplicationController

  def new
    redirect_to root_url, notice: "You are logged in." if current_manager
  end

  def create
    if manager_params[:password].blank?
      PasswordResetter.new(flash).set_reset_code_and_notify_manager(manager_params[:email])
    else
      manager = ManagerAuthenticator.new(flash).authenticate_manager(manager_params)
      return if log_manager_in_and_redirect( manager )
    end

    @email = manager_params[:email]
    render :new
  end

  def destroy
    log_manager_out_and_redirect
  end

  private

  def manager_params
    params.require(:manager).permit( :email, :password )
  end
end
