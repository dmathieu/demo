class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true
  
  belongs_to :category
  belongs_to :user
  
  after_create :send_new_notification
  
  scope :posts_day, lambda { |day|
    where(['updated_at BETWEEN ? AND ?', day.beginning_of_day, day.end_of_day])
  }
  
  def serializable_hash(options={})
    {
      :title => title,
      :content => content,
      :category => category,
      :user => user
    }
  end
  
  
  def send_new_notification
    PostsMailer.new_post_notification(User.all, @post).deliver
  end
end