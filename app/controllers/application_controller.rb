class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied, :with => :access_denied
  
  private
  def access_denied
    redirect_to root_url
  end
end
