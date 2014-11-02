class Location < ActiveRecord::Base
  belongs_to :user
  has_many :games, dependent: :destroy

  STATES = %w(AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TB TX UT VT VA WA WV WI WY AS GU MP PR VI)

  validates :name, uniqueness: true
  validates :address, :name, :city, :state, presence: true
  validates :state, inclusion: { in: STATES, message: "must be real" }

  def self.search(search)
    if search
      where("name ILIKE?", "%#{search}%")
    else
      all
    end
  end

end
