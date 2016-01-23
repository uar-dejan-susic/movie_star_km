require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:genre_id) }
    it { should validate_uniqueness_of(:name) }
  end

  context 'relationships' do
    it { should belong_to(:genre) }

    it { should have_many(:user_movies) }
    it { should have_many(:users).through(:user_movies) }
  end

  describe Movie, 'column_specification' do
    it { should have_db_column(:name).of_type(:string).with_options(presence: true, uniqueness: true) }
    it { should have_db_column(:genre_id).of_type(:integer).with_options(presence: true) }
    it { should have_db_column(:year).of_type(:integer) }
    it { should have_db_column(:producer).of_type(:string) }
    it { should have_db_column(:director).of_type(:string) }
    it { should have_db_column(:imdblink).of_type(:string) }
  end
end
