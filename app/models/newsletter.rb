class Newsletter < ActiveRecord::Base

  attr_accessible :subscription, :subscription_token

  belongs_to :user



end
