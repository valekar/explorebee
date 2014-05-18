class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.belongs_to :post, index: true
      t.string :image

      t.timestamps
    end
  end
end
