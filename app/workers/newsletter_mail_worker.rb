class NewsLetterMailWorker
  include Sidekiq::Worker

  def perform()
    #@user = User.find(user_id)
    #UserMailer.signup_confirmation(@user).deliver

    @newsletters = Newsletter.where(subscription:true)

    @newsletters.each do |newsletter|
      user = newsletter.user
      p user
      UserMailer.newsletter(user).deliver
    end


  end

end
