class SearchController < ApplicationController

  def index
    @search_presenter = SearchPresenter.new(params[:q])
  end

end
