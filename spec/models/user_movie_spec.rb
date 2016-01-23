require 'rails_helper'

RSpec.describe UserMovie, type: :model do
  context 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:movie_id) }
  end

  context 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end
end
