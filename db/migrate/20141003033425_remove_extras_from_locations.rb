class RemoveExtrasFromLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :name
    remove_column :locations, :state
    remove_column :locations, :city
    remove_column :locations, :zip_code
    add_column :locations, :park_name, :string, null: false
  end
  def down
    add_column :locations, :name, :string, null: false
    add_column :locations, :state, :string, null: false
    add_column :locations, :city, :string, null: false
    add_column :locations, :zip_code, :integer, null: false
    remove_column :locations, :park_name, :string
  end
end
