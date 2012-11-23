class CreateAssociates < ActiveRecord::Migration
  def change
    create_table :associates do |t|
      t.integer :associate_id
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
