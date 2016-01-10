class MoviesController < ApplicationController
  def index
    @items = Movie.all
  end

  def new
  end
end
