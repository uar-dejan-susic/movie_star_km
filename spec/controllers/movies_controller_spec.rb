require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe 'anonymous user' do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it 'should be redirected to signin' do
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end
  end

  it "should let a user see all the movies" do
    login_with create( :user )
    get :index
    expect( response ).to render_template( :index )
  end

  context 'with valid attributes' do
    it 'creates the movie' do
      login_with create( :user )
      Integer mcount = Movie.count
      post :create, movie: attributes_for(:movie)
      expect(Movie.count).to eq(mcount + 1)
    end
  end

end
