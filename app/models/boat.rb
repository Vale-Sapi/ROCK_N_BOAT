class Boat < ApplicationRecord
  has_many :bookings

  belongs_to :user, through :bookings
end
