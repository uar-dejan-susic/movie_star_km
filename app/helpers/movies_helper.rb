module MoviesHelper

  def show_image (movie)
      if !movie.nil?
         if !movie.image.present? and !movie.image.thumb.present? and !movie.image.thumb.url.present?
           return image_tag movie.image.thumb.url
         else
           return image_tag('/images/movies.jpg')
         end
      end
  end

  def show_add_to_collection_btn (usermovies, movie)
    if !usermovies.include? movie.id
      "<a data-original-title='Add to my collection' class='btn btn-default ucollicon' data-id=#{movie.id} data-method='post' data-placement='right' data-toggle='tooltip' href='#' id= #{movie.id} rel='nofollow' title=""><i class='fa fa-save'></i></a>"
    end
  end

end
