require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should return the posts for yesterday" do
    assert_not_equal users(:default).posts.posts_day(1.day.ago).count, 0
    users(:default).posts.posts_day(1.day.ago).all.each do |post|
      assert post.updated_at >= 1.day.ago.beginning_of_day
      assert post.updated_at <= 1.day.ago.end_of_day
    end
  end
  
  test "it should work with chained methods" do
    assert_not_equal Post.where(:user_id => users(:default).id).posts_day(1.day.ago).count, 0
  end
end
