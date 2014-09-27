class AddLocationIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :location_id, :integer, null: false
  end
end
