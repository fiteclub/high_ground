class CreateWarriors < ActiveRecord::Migration[6.0]
  def change
    create_table :warriors do |t|
      t.string :title, null: false
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :elevation
      t.integer :wins, default: 0, null: false
      t.integer :losses, default: 0, null: false
      t.integer :ties, default: 0, null: false

      t.timestamps
    end
  end
end
