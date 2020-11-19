module WarriorsHelper
  
  def elevation(latitude, longitude)
    query="https://api.elevationapi.com/api/Elevation?lat=#{latitude}&lon=#{longitude}&dataSet=SRTM_GL3"
    json = Net::HTTP.get_response(URI(query)).body
    parsed = JSON.parse(json)
    if parsed["message"] == "OK"
      elev_return = parsed["geoPoints"][0]["elevation"]
    else
      elev_return = 0
      return "Error"
    end
    elev_return
  end
end
