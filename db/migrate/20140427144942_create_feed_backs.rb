class CreateFeedBacks < ActiveRecord::Migration
  def change
    create_table :feed_backs do |t|
      t.string :email
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
