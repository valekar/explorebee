class Newsletter < ActiveRecord::Base

  attr_accessible :subscription, :subscription_token

  belongs_to :user



  def week_newsletter
=begin
    @newsletters = Newsletter.where(subscription:true)

    @newsletters.each do |newsletter|
      user = newsletter.user
      p user
      UserMailer.newsletter(user).deliver
    end
=end


    #NewsLetterMailWorker.perform_async

  end



end
