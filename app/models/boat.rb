class Boat < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings #2/3 customer

  belongs_to :user
  validates :name, :location, :price, presence: true
end
