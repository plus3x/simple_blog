class SearchBlogController < ApplicationController
  skip_before_action :authorize
  
  # GET /search_blog
  def search
  end

  # POST /find_blog?rating_up=5&rating_down=2&date=20.12.2013
  def find
    @blogs = Blog.select do |blog| 
      (blog.rating > search_blog_params[:rating_down].to_i) and 
      (blog.rating < search_blog_params[:rating_up].to_i)   and
      (blog.created_at == search_blog_params[:date])
    end
  end
  
  private
    def search_blog_params
      params.require(:search_blog).permit(:rating_up, :rating_down, :date)
    end
end