class NewsletterController < ApplicationController
  def edit
    @user = Newsletter.where(subscription_token: params[:id]).first.user
  end


  def update
    @user = Newsletter.where(subscription_token: params[:id]).first.user
    @user.newsletter.update_attribute(:subscription,false)


    respond_to do |f|
      flash.now[:alert] = "Unsubscribed,Please give the feedback for your unsubscription"

      f.html {redirect_to :root}
    end


  end


end
