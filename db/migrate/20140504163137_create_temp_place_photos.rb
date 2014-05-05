class CreateTempPlacePhotos < ActiveRecord::Migration
  def change
    create_table :temp_place_photos do |t|
      t.string :image

      t.timestamps
    end
  end
end
