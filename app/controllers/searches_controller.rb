class SearchesController < ApplicationController
  def index
    @results = PgSearch.multisearch(params[:query]).page(1).per(10)
  end
end
