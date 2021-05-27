class Boat < ApplicationRecord
  has_many :bookings

  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [:location],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
