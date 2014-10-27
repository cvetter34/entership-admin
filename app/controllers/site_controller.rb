class SiteController < ApplicationController
  before_action :is_authenticated?

  def index
    @contacts = Contact.where( has_been_seen: false ).sort {|x,y| x <=> y }
    @num_managers = Manager.all.count
    @num_members = Member.all.count
    @num_directors = Manager.where( is_director: true ).count
    @num_companies = Company.where( is_vetted: true ).count
    @num_jobs = Job.where( expired_on: nil ).count
    @num_apps = App.where( status: "pending" ).count
    @num_contacts = Contact.all.count
  end
end
