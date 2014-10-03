class Location < ActiveRecord::Base
  belongs_to :user
  has_many :games, dependent: :destroy

  validates :name, :address, presence: true

  def self.search(search)
    if search
      where("name ILIKE?", "%#{search}%")
    else
      all
    end
  end

end
