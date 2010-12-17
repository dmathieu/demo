class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, :type => String
  field :content, :type => String
  field :slug, :type => String
  
  validates :title, :presence => true
  validates :content, :presence => true
  
  #belongs_to :category
  #belongs_to :user
  
  after_create :send_new_notification
  before_save  :set_slug
  
  #scope :posts_day, lambda { |day|
  #  where(['updated_at BETWEEN ? AND ?', day.beginning_of_day, day.end_of_day])
  #}
  
  def serializable_hash(options={})
    {
      :title => title,
      :content => content,
      #:category => category,
      #:user => user
    }
  end
  
  
  def send_new_notification
    PostsMailer.new_post_notification(User.all, @post).deliver
  end
  
  def set_slug
    self.slug = title.to_permalink
  end
  
  def to_param
    slug
  end
end