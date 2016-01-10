class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.string :producer
      t.string :director
      t.string :imdblink
      t.integer :genre_id

      t.timestamps
    end
  end
end
