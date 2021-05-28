class HomeController < ApplicationController
  def index
  	@post = Post.order(params[:sort])
  end
end
