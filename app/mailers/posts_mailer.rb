class PostsMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def new_post_notification(users, post)
    @post = post
    
    mail :subject => "A new post has been created",
          :to => users.map {|u| u.email }
  end
end
