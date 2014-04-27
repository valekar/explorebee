class ConfirmationMailWorker
  include Sidekiq::Worker

  def perform(user_id,password,flag)
=begin

    ids = values[0]
    password = values[1]
    flag = values[2]

    p values[0]
    p values[1]
    p values[2]
=end

    @user = User.find(user_id)
    UserMailer.signup_confirmation(@user,password,flag).deliver
  end

end