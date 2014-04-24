class ConfirmationMail
  include Sidekiq::Worker

  def perform(user_id)

    @user = User.find(user_id)

    UserMailer.newsletter(@user).deliver
  end

end