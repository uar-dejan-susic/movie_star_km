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

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
