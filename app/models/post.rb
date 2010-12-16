class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true
  
  belongs_to :category
  belongs_to :user
  
  scope :posts_day, lambda { |day|
    where(['updated_at BETWEEN ? AND ?', day.beginning_of_day, day.end_of_day])
  }
end