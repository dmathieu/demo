class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  rescue_from CanCan::AccessDenied, :with => :access_denied
  
  private
  def access_denied
    redirect_to root_url
  end
  
  def set_locale
    I18n.locale = current_user.locale if current_user
    I18n.locale ||= favorite_locale
  end
  
  def favorite_locale
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
