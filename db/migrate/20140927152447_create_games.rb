class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_name, null: false
      t.time :time, null: false
      t.date :date, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
