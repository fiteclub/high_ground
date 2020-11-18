class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.decimal :latitude, precision: 7, scale: 5
      t.decimal :longitude, precision: 8, scale: 5
      t.integer :altitude

      t.timestamps
    end
  end
end
