class PostImage < ActiveRecord::Base
  attr_accessible :image,:remote_image_url

  mount_uploader :image, ImageUploader

  belongs_to :post
end
