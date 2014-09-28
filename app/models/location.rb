class Location < ActiveRecord::Base
  belongs_to :user
  has_many :games, dependent: :destroy

  validates :name, :address, :city, :state, :zip_code, presence: true
end
