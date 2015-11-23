class IndexController < ApplicationController
  def index
  end

  def register
    @newsletter = Newsletter.new

    @newsletter.email = params[:email]
    @newsletter.name = params[:name]

    @newsletter.save

    flash[:notice] = "Thank you for registering!"

    redirect_to :root
  end

  def contact
    @contact = Contact.new
    @contact.email = params[:email]
    @contact.name = params[:name]
    @contact.message = params[:message]

    @contact.save

    flash[:notice] = "Thank you for your message!"
    redirect_to :root
  end
end
