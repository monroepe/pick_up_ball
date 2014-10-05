class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.integer :user_id
      t.string :address, null: false
      t.text :description

      t.timestamps
    end
  end
end
