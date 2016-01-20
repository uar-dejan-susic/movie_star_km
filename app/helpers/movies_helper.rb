module MoviesHelper

  def show_image(movie)
      if !movie.nil?
         if !movie.image.present? and !movie.image.thumb.present? and !movie.image.thumb.url.present?
           return image_tag movie.image.thumb.url
         else
           return image_tag('/images/movies.jpg')
         end
      end
  end

  def is_users_movie(movie)
    return (!@usermovies.include? movie.id)
  end

  def is_users_movie_v2(movie)
    return !(current_user.user_movies.map(&:movie_id).include? movie.id)
  end

end
