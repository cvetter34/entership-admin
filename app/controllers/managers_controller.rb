class ManagersController < ApplicationController
  before_action :is_authenticated?
  before_action :is_director?
  before_action :set_manager, except: [ :index, :new, :create ]

  def index
    @managers = Manager.all

    respond_to do |format|
      format.html
      format.html.tablet
      format.html.phone
    end
  end

  def show
  end

  def new
    @manager = Manager.new
  end

  def create
    if @manager = Manager.create( manager_params )
      ManagerNotifier.welcome_new_manager(@manager).deliver

      redirect_to admins_url, notice: "Successfully created #{@manager.name}."
    else
      flash.now[:alert] = @manager.errors
      render :new
    end
  end

  def edit
  end

  def update
    if @manager.update_attributes( manager_params )
      redirect_to managers_url, notice: "Successfully updated #{@manager.name}."
    else
      flash.now[:alert] = @manager.errors
      render :edit
    end
  end

  def destroy
    @manager.destroy
    redirect_to managers_url, notice: "Successfully deleted #{@manager.name}."
  end

  private

  def is_director?
    redirect_to root_url unless @current_manager.is_director
  end

  def set_manager
    redirect_to managers_url unless @manager = Manager.find_by( id: params[:id] )
  end

  def manager_params
    params.require(:manager).permit( :name, :email, :is_director )
  end
end
