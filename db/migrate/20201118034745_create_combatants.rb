class CreateCombatants < ActiveRecord::Migration[6.0]
  def change
    create_table :combatants do |t|
      t.string :first_name
      t.string :last_name
      t.integer :wins, default: 0, null: false
      t.integer :losses, default: 0, null: false
      t.integer :ties, default: 0, null: false
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
