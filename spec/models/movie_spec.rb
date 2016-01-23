require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:genre_id) }
    it { should validate_uniqueness_of(:name) }
  end

  context "relationships" do
    it { should belong_to(:genre) }
  end
end
