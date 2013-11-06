class PostsController < ApplicationController
	
  def show
  end

  respond_to :json, :xml
  def index
    @posts = Post.all
  end

  def create

    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Submitted."
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  def retether
    @post = Post.find(params[:id])
    @post.tether 
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:content, :lat, :long, :originLat, :originLong, :distanceTraveled)
  end

end
