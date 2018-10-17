class SearchController < ApplicationController

  def index
    state = params[:q]
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["nrel_api_key"]
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?fuel_type=ELEC,LPG&location=80203&radius=6.0&limit=10")

    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations].map do |station_data|
      Station.new(station_data)
    end
  end

end
