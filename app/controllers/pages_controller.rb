class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def welcome
    @contact = Contact.new(params[:contact])
  end

  def create
    # for contact_form creation
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      @contact = Contact.new # re-initialize Contact object for cleared form
      flash.notice = 'Message was successfully sent! We appreciate your feedback.'
    else
      flash.alert = 'Could not send message.'
    end
    render 'welcome'
  end

  def about; end
end
