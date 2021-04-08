class FlatsController < ApplicationController

  def index
    @flats = Flat.where.not(latitude: nil, longitude: nil)

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

end

  