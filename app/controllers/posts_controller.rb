class PostsController < ApplicationController

  def index
    #@posts = Post.order("created_at DESC").all
    @posts = Post.all.to_a
  end

  def show
    @post = Post.find(params[:id])

    rescue ActiveRecord::RecordNotFound
    flash[:error] = "The post doesn't exist."
    redirect_to root_path
  end

end
