require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe 'anonymous user' do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it 'should be redirected to signin' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  it "should let a user see all the movies" do
    login_with create( :user )
    get :index
    expect(response).to render_template(:index)
  end

  context 'with valid attributes' do
    it 'creates the movie' do
      login_with create( :user )
      Integer mcount = Movie.count
      post :create, movie: attributes_for(:movie)
      expect(Movie.count).to eq(mcount + 1)
    end
  end

  context 'with invalid attributes' do
    it 'does not create the movie' do
      login_with create( :user )
      Integer mcount = Movie.count
      post :create, movie: attributes_for(:movie, name: nil)
      expect(Movie.count).to eq(mcount)
    end

    it 're-renders the "new" view' do
      login_with create( :user )
      post :create, movie: attributes_for(:movie, name: nil)
      expect(response).to render_template :new
    end
  end

  context 'json' do
    context 'with valid attributes' do
      it 'creates the movie-user association' do
        login_with create( :user )
        Integer user_movies_count = UserMovie.count
        post :add_to_users_collection, id: Movie.first.id, format: :json
        expect(UserMovie.count).to eq(user_movies_count + 1)
      end

      it 'responds with 201' do
        login_with create( :user )
        post :add_to_users_collection, id: Movie.first.id, format: :json
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'GET new' do
    it 'assigns a new movie as @movie' do
      login_with create( :user )
      get :new
      expect(assigns(:movie)).to be_a_new(Movie)
    end
  end

  describe 'GET edit' do
    before :each do
      @existing_movie = Movie.create!({name: 'Movie 1', genre_id: Genre.first.id })
    end

    it 'assigns the requested movie as @movie' do
      login_with create( :user )
      get :edit, {:id => @existing_movie.to_param}
      expect(assigns(:movie)).to eq(@existing_movie)
    end
  end

  describe "PUT update" do
    before :each do
      @movie = FactoryGirl.create(:movie)
      @movie_update_attributes = FactoryGirl.attributes_for(:movie)
      login_with create( :user )
    end

    def put_update
      put :update, :movie => @movie_update_attributes, :id => @movie
    end

    describe "with valid params" do
      it "assigns the requested movie as @movie" do
        put_update
        expect(assigns(:movie)).to eq(@movie)
      end

      it "redirects to the movies index page" do
        put_update
        expect(response).to redirect_to(movies_path + '?notice=Movie+was+successfully+updated.')
      end
    end

    describe "with invalid params" do
      before :each do
        Movie.any_instance.stub(:save).and_return(false)
      end

      it "re-renders the 'edit' template" do
        put_update
        expect(response).to render_template("edit")
      end
    end
  end


end
