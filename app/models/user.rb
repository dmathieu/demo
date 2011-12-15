class User < ActiveRecord::Base

  validates :username,
    :presence => true,
    :uniqueness => true
  validates :email,
    :presence => true,
    :uniqueness => true,
    :format => {:with => /(.*)@(.*)/}

  after_create :send_email

  private
  def send_email
    UserMailer.notify_new(self).deliver
  end
end
