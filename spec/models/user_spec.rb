require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:email) }
  end

  context 'relationships' do
    it { should have_many (:user_movies) }
    it { should have_many(:movies).through(:user_movies) }
  end


end
