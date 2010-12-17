require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "a post is indeed a post" do
    assert_kind_of Post, posts(:hello)
  end
  
  [:title, :content].each do |field|
    test "validates the presence of the #{field}" do
      params = default_params
      params.delete field
      post = Post.new params
      assert !post.save
    end
  end
  
  test "creates a new post" do
    assert Post.new(default_params).save
  end
  
  test "should send an email when creating a new post" do
    mails_count = ActionMailer::Base.deliveries.length
    assert Post.create(default_params)
    assert ActionMailer::Base.deliveries.length, mails_count + 1
  end
  
  
  private
  def default_params
    { :title => 'Hey', :content => 'Content'}
  end
end
