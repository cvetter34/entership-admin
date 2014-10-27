class MembersController < ApplicationController
  before_action :is_authenticated?
  before_action :set_member, except: [ :index, :new, :create ]

  def index
    @members = Member.all

    respond_to do |format|
      format.html
      format.html.tablet
      format.html.phone
    end
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create( member_params )

    if @member.valid?
      redirect_to member_url(@member), notice: "Successfully created #{@member.name}."
    else
      flash.now[:alert] = @member.errors
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update_attributes( member_params )
      redirect_to member_url(@member), notice: "Successfully updated #{@member.name}."
    else
      flash.now[:alert] = @member.errors
      render :edit
    end
  end

  def destroy
    @member.destroy

    if request.xhr?
      flash[:notice] = "Successfully deleted #{@member.name}."
      head :no_content
    else
      redirect_to members_url, notice: "Successfully deleted #{@member.name}."
    end
  end

  private

  def set_member
    redirect_to members_url unless @member = Member.find_by( slug: params[:id] )
  end

  def member_params
    params.require(:member).permit(
      :title,
      :name_given,
      :name_family,
      :email,
      :born_on,
      :street_address,
      :city,
      :postal_code,
      :country_code,
      :nationality_code,
      :current_status,
      :experience,
      :phone,
      :mobile,
      :website_url,
      :occupation,
      :notice,
      :will_relocate,
      :is_public,
      :aspirations,
      :hobbies,
      :references,
      :comments,
      :photo,
      :photo_cache,
      :sectors => []
    )
  end
end
