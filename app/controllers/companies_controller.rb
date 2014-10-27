class CompaniesController < ApplicationController
  before_action :is_authenticated?
  before_action :set_company, except: [ :index, :new, :create ]

  def index
    @companies = Company.order(is_vetted: :asc, name: :asc)

    respond_to do |format|
      format.html
      format.html.tablet
      format.html.phone
    end
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    if @company = Company.create( company_params )
      redirect_to company_url(@company), notice: "Successfully created #{@company.name}."
    else
      flash.now[:alert] = @company.errors
      render :new
    end
  end

  def edit
  end

  def update
    puts
    puts
    puts ">>>>> UPDATING THESE ATTRIBUTES!", company_params
    puts
    puts
    if @company.update_attributes( company_params )
      redirect_to company_url(@company), notice: "Successfully updated #{@company.name}."
    else
      flash.now[:alert] = @company.errors
      render :edit
    end
  end

  def destroy
    @company.destroy

    if request.xhr?
      flash[:notice] = "Successfully deleted #{@company.name}."
      head :no_content
    else
      redirect_to companies_url, notice: "Successfully deleted #{@company.name}."
    end
  end

  def vet
    @company.is_vetted = true

    if @company.save
      flash[:notice] = "#{@company.name} approved."
    else
      flash[:error] = "Failed to approve {@company.name}."
    end

    redirect_to companies_url
  end

  def unvet
    @company.is_vetted = false

    if @company.save
      flash[:notice] = "#{@company.name} suspended."
    else
      flash[:error] = "Failed to suspend {@company.name}."
    end

    redirect_to companies_url
  end

  private

  def set_company
    redirect_to companies_url unless @company = Company.find_by( slug: params[:id] )
  end

  def company_params
    params.require(:company).permit(
      :name,
      :email,
      :address,
      :address_alt,
      :country_code,
      :company_type,
      :company_size,
      :contact_person,
      :contact_email,
      :phone,
      :mobile,
      :fax,
      :website_url,
      :year_founded,
      :description,
      :year_founded,
      :logo,
      :logo_cache,
      :sectors => []
    )
  end
end
