class Game < ActiveRecord::Base
  belongs_to :location
  belongs_to :user

  validates :game_name, :time, :date, :description, :location_id, presence: true
end
