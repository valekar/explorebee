class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.belongs_to :user, index: true
      t.boolean :subscription
      t.string :subscription_token

      t.timestamps
    end
  end
end
