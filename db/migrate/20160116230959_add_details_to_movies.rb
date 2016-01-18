class AddDetailsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :image, :string
    add_column :movies, :thumbnail, :string
  end
end
