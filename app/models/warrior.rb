class Warrior < ApplicationRecord
  geocoded_by :address
  after_validation :fetch_geo_data
  
  def self.duel(player_one, player_two)
    {}.tap do |hash|
      hash[:elevation_diff] = (player_one.elevation - player_two.elevation).abs
      hash[:tie] = player_one.as_high_as player_two
      hash[:winner] = player_one > player_two ? player_one : player_two unless hash[:tie]
      hash[:loser] = player_one < player_two ? player_one : player_two unless hash[:tie]
    end
  end

  def fetch_geo_data
    geocode if updated_address? && autolocate?
    reverse_geocode if updated_coordinates? && address.blank? && autolocate?
    get_elevation if updated_coordinates?
  end

  def get_elevation
    query="https://api.elevationapi.com/api/Elevation?lat=#{latitude}&lon=#{longitude}&dataSet=SRTM_GL3"
    json = Net::HTTP.get_response(URI(query)).body
    self.elevation = JSON.parse(json)["geoPoints"][0]["elevation"]
  end

  # Mapbox returns a series of ele values in an array, which do not add to the correct value
  # def get_elevation_mapbox
  #   query="https://api.mapbox.com/v4/mapbox.mapbox-terrain-v2/tilequery/#{longitude},#{latitude}.json?&access_token=#{ENV['MAPBOX_ACCESS_TOKEN']}"
  #   json = Net::HTTP.get_response(URI(query)).body
  #   self.elevation = JSON.parse(json)["geoPoints"][0]["elevation"]
  # end

  def as_high_as(opponent)
    elevation == opponent.elevation
  end

  def >(opponent)
    elevation > opponent.elevation
  end
  
  def <(opponent)
    elevation < opponent.elevation
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
