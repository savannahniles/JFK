class StaticPagesController < ApplicationController
  
  def home
  	Post.drift
  	@post = Post.new
  	@posts = Post.all
  end

  def about
  end

end
