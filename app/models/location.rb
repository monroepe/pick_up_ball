class Location < ActiveRecord::Base
  belongs_to :user
  has_many :games, dependent: :destroy

  validates :address, :park_name, presence: true
end
