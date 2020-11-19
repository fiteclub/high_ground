class CreateWarriors < ActiveRecord::Migration[6.0]
  def change
    create_table :warriors do |t|
      t.string :title
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :elevation
      t.integer :wins
      t.integer :losses
      t.integer :ties

      t.timestamps
    end
  end
end
