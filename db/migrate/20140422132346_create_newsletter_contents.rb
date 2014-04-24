class CreateNewsletterContents < ActiveRecord::Migration
  def change
    create_table :newsletter_contents do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
