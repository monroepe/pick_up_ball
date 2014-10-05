class Location < ActiveRecord::Base
  belongs_to :user
  has_many :games, dependent: :destroy

  validates :park_name, uniqueness: true
  validates :address, :park_name, presence: true

  def self.search(search)
    if search
      where("name ILIKE?", "%#{search}%")
    else
      all
    end
  end

end
