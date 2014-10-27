class ContactsController < ApplicationController
  before_action :is_authenticated?
  before_action :set_contact

  def index
    @contacts = Contact.all.sort {|x,y| x <=> y }
    @num_unread = Contact.where( has_been_seen: false ).count

    respond_to do |format|
      format.html
      format.html.tablet
      format.html.phone
    end
  end

  def destroy
    status = :no_content

    if @contact = Contact.find_by( id: params[:id] )
      if @contact.destroy
        flash[:notice] = %{
          Successfully deleted <strong>#{@contact.subject}</strong>
          from <strong>#{@contact.member.name}</strong>.
        }.squish
      else
        status = :unprocessable_entity
        flash[:alert] = "Unable to delete contact."
      end
    else
      status = :not_found
      flash[:alert] = "Contact not found."
    end

    request.xhr? ? head(status) : redirect_to(root_url)
  end

  private

  def set_contact
    if @contact = Contact.find_by( id: params[:contact] )
      @contact.has_been_seen = true
      @contact.save
    end
  end
end
