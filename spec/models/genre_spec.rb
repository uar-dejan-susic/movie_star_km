require 'rails_helper'

RSpec.describe Genre, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe Genre, 'column_specification' do
    it { should have_db_column(:name).of_type(:string).with_options(presence: true, uniqueness: true) }
  end
end
