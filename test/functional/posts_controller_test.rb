require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test "it should render the show page" do
    get :show, { :id => posts(:hello).id }
    assert_response :success
    assert_equal assigns(:post), posts(:hello)
  end
  
  test "it should render a 404" do
    assert_raises ActiveRecord::RecordNotFound do
      get :show, { :id => 42}
    end
  end
  
  test "it should create a new post" do
    post :create, { :post => { :title => 'Hello', :content => 'World'}}
    assert_response :redirect
    assert_not_nil Post.where(:title => 'Hello', :content => 'World').first
  end
  
  test "it should not create a new post" do
    post :create, {}
    assert_response :success
  end
  
  test "it should update a post" do
    put :update, { :post => { :title => 'Hey', :content => 'My New Content'},
                   :id => posts(:hello).id}
    assert_response :redirect
    assert_equal Post.find(posts(:hello).id).title, 'Hey'
    assert_equal Post.find(posts(:hello).id).content, "My New Content"
  end
  
  test "it should not update a post" do
    put :update, { :id => posts(:hello).id,
                   :post => { :title => "" } }
    assert_response :success
    assert_equal Post.find(posts(:hello).id).title, "Hello World"
    assert_equal Post.find(posts(:hello).id).content, "My Content"
  end
  
  def setup
    sign_in users(:default)
  end
end
