class SearchController < ApplicationController

  def index
    @search_presenter = SearchPresenter.new(params[:q])
    # @stations = Station.stations_data(params[:q])
  end

end
