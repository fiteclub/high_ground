class AddAutolocateToWarriors < ActiveRecord::Migration[6.0]
  def change
    add_column :warriors, :autolocate, :boolean, default: true, null: false
  end
end
