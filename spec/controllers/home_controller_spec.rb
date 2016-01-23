require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'redirects to the "movies index" action for the authenticated user' do
      login_with create( :user )
      get :index
      expect(response).to redirect_to movies_path
    end
  end

end
