class HomeController < ApplicationController
  skip_before_action :authorize
  
  # GET /
  def index
    @blogs = Blog.order(:rating).reverse.first 10
  end
end
