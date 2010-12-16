require 'test_helper'

class MainControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test "should set the locale in en" do
    @request.env['HTTP_ACCEPT_LANGUAGE'] = 'en'
    get :index
    assert_equal I18n.locale, :en
  end
  
  test "should set the locale in fr" do
    @request.env['HTTP_ACCEPT_LANGUAGE'] = 'fr'
    get :index
    assert_equal I18n.locale, :fr
  end
  
  test "should set the locale to the user's" do
    sign_in users(:default)
    get :index
    assert_equal I18n.locale, :fr
  end
end
