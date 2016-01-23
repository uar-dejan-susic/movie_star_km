class MoviesController < ApplicationController

  before_filter :get_genres
  before_action :authenticate_user!


  def index
    @movies = Movie.all
    @usermovies = UserMovie.where("user_id = " + current_user.id.to_s).pluck(:movie_id)
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to :controller => 'movies', :action => 'index', notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @movie = Movie.find(params[:movie][:id])

    respond_to do |format|
      if @movie.update_attributes(movie_params)
        format.html { redirect_to :controller => 'movies', :action => 'index', notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_users_collection
    @usermovie = UserMovie.new
    @usermovie.user_id = current_user.id
    @usermovie.movie_id = params[:id]

    respond_to do |format|
      if @usermovie.save
        format.html { redirect_to :controller => 'movies', :action => 'index', notice: 'Movie was successfully added to your collection.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_genres
    @genres = Genre.all
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :year, :director, :producer, :imdblink, :genre_id, :image, :id)
  end

end
