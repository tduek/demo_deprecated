class PagesController < ApplicationController

  def search
    if params[:query]
      @results = PgSearch.multisearch(params[:query])
    else
      @result = PgSearch::Document
    end

    @result = @result.includes(:searchable).page(params[:page])
  end

end
