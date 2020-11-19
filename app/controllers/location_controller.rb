class LocationController < ApplicationController
  def index
    @locations = Location.order('id ASC')
  end
end
