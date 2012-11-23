class CreateAssociateLocations < ActiveRecord::Migration
  def change
    create_table :associate_locations do |t|
      t.integer :associate_id
      t.integer :location_id
      t.integer :vnet
      t.string :seat_number
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
