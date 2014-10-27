class PasswordController < ApplicationController
  PASSWORD_RESET_SUCCESSFUL = "Your password has been successfully reset."

  USER_NOT_FOUND = %{ Sorry, your reset link has expired.
    Please generate a new one.}.squish

  def edit
    unless @manager = Manager.find_by_code( params[:code] )
      redirect_to login_form_url, notice: USER_NOT_FOUND
    end
    @nologin = true
  end

  def update
    if @manager = Manager.find_by_code( params[:code] )
      resetter = PasswordResetter.new(flash)

      if resetter.update_password( @manager, manager_params )
        flash[:notice] = PASSWORD_RESET_SUCCESSFUL
        log_manager_in_and_redirect( @manager )
      else
        flash.now[:alert] = @manager.errors
        render :edit
      end
    else
      redirect_to login_form_url, alert: USER_NOT_FOUND
    end
  end

  private

  def manager_params
    params.require(:manager).permit( :password, :password_confirmation )
  end
end
