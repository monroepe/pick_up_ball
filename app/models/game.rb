class Game < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :users, through: :players

  validates :game_name, :time, :date, :description, :location_id, presence: true
end
