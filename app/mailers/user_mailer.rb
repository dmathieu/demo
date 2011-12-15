#encoding: utf-8
class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def notify_new(user)
    @user = user
    mail(:to => [user.email],
         :subject => 'Un compte a été créé')
  end
end
