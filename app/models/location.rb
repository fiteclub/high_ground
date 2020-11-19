class Location < ApplicationRecord
  has_many :combatants
  geocoded_by :full_address, latitude: :latitude, longitude: :longitude
  after_validation :geocode

  def full_address
    [address_1, address_2, city, state, zip].compact.join(', ')
  end
end
