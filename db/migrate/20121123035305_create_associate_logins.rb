class CreateAssociateLogins < ActiveRecord::Migration
  def change
    create_table :associate_logins do |t|
      t.integer :associate_id
      t.integer :location_id
      t.string :login_ip
      t.float :login_latitude
      t.float :login_longitude

      t.timestamps
    end
  end
end
