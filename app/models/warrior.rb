class Warrior < ApplicationRecord
  geocoded_by :address
  after_validation :fetch_geo_data

  def fetch_geo_data
    geocode if updated_address?
    reverse_geocode if updated_coordinates? && address.blank?
    get_elevation if updated_coordinates?
  end

  def get_elevation
    query="https://api.elevationapi.com/api/Elevation?lat=#{latitude}&lon=#{longitude}&dataSet=SRTM_GL3"
    json = Net::HTTP.get_response(URI(query)).body
    self.elevation = JSON.parse(json)["geoPoints"][0]["elevation"]
  end

  private

  def updated_coordinates?
    latitude.present? && 
    latitude_changed? && 
    longitude.present? && 
    longitude_changed?
  end

  def updated_address?
    address.present? &&
    address_changed?
  end
  
end
