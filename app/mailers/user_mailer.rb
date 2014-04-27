require 'uri'
class UserMailer < ActionMailer::Base
  default from: "srinivas.valekar@explorebee.com"


  def signup_confirmation(user,password,flag)
   @user = user

   @flag = flag
   @password = password

    mail to: user.email,subject: "Sign Up Confirmation"
  end


  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end



  def newsletter(user)
    @user = user

    @root_path = root_url.chomp("/")

   # attachments.inline['photo.png'] = "#{root_url}assets/logo.png"


    @posts = Post.where("created_at>=?", 7.days.ago).limit 2

    @places = Place.where("created_at>=?", 177.days.ago).limit 2

    @newsletter_content =  NewsletterContent.where("created_at>=?", 7.days.ago).limit 2


    mail :to => user.email, :subject => "Weekly News"
  end

end



