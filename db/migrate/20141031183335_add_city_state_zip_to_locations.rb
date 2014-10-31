class AddCityStateZipToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :city, :string, null: false
    add_column :locations, :state, :string, null: false
  end
end
