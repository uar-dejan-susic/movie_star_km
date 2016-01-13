class SeedHelper

  def self.create_genres
    puts "Creating Movie Genres"
    ["Action", "Drama", "Horror", "Adventure", "Science Fiction"].each_with_index{ |n,i| Genre.create(id: i+1, name: n)}
  end


  def self.seed
    ActiveRecord::Base.transaction do

      create_genres
    end

  end
end