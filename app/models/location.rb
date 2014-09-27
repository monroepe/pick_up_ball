class Location < ActiveRecord::Base
  belongs_to :user

  validates :name, :address, :city, :state, :zip_code, presence: true
end
