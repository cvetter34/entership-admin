class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_manager

  before_action :detect_device_format
  before_filter :make_action_mailer_use_request_host_and_protocol

  def current_manager
    @current_manager ||= Manager.find_by( id: session[:manager_id] )
  end

  def is_authenticated?
    unless current_manager
      if request.xhr?
        head :unauthorized
      else
        session[:redirect_to] = request.fullpath
        redirect_to login_form_url
      end
    end
  end

  def log_manager_in_and_redirect(manager)
    if manager
      session[:manager_id] = manager.id

      redirect_to root_url
    end
  end

  def log_manager_out_and_redirect
    session[:manager_id] = nil
    redirect_to login_form_url, notice: "You've successfully logged out."
  end

  def set_attributes
    if current_manager
      set_unread_notes       # Get the unread notes for navbar
      set_jobs_applied_to   # Get the jobs applied to for jobs page
      set_pending_apps  # Get the pending apps for navbar
    end
  end

  private

  def detect_device_format
    if browser.tablet?
      request.variant = :tablet
    elsif browser.mobile?
      request.variant = :phone
    else
      request.variant = :desktop
    end
  end

  def make_action_mailer_use_request_host_and_protocol
    ActionMailer::Base.default_url_options[:protocol] = request.protocol
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end
