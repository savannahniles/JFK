class StaticPagesController < ApplicationController
  
  def home
  	@post = Post.new
  	@posts = Post.all
  end

  def about
  end
end
