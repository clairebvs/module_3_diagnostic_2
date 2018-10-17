class SearchController < ApplicationController

  def index
    @stations = Station.stations_data(params[:q])
  end

end
