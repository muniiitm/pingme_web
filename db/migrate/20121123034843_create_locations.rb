class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.float :latitude
      t.float :longitude
      t.string :geocoder_service
      t.boolean :user_defined

      t.timestamps
    end
  end
end
