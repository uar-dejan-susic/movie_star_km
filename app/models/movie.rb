class Movie < ActiveRecord::Base
  belongs_to :genre

  validates :name, presence: true, uniqueness: true
  validates :genre_id, presence: true

  validate :year_cannot_be_more_than_3_year_in_future

  def year_cannot_be_more_than_3_year_in_future
    if year.present? && year > (Date.today + 3.years).year
      errors.add(:year, "can't be more than 3 years in the future")
    end
  end
end


