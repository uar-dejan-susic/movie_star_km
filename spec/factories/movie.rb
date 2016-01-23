FactoryGirl.define do
  factory :movie do
    name   SecureRandom.uuid
    genre_id    1
    year    2014
  end
end