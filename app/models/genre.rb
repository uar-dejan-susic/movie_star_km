class Genre < ActiveRecord::Base
  has_many :movies

  validates :name, presence: true, uniqueness: true
end
