class Warrior < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :reverse_geocode, unless: ->(obj) { obj.address.present? },
                   if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
  after_validation :get_elevation


  def get_elevation
    query="https://api.elevationapi.com/api/Elevation?lat=#{latitude}&lon=#{longitude}&dataSet=SRTM_GL3"
    json = Net::HTTP.get_response(URI(query)).body
    self.elevation = JSON.parse(json)["geoPoints"][0]["elevation"]
  end
  
end
