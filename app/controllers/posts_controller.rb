class PostsController < ApplicationController

  def index

    #@posts = Post.order("created_at DESC").all
    @posts = Post.all.to_a

  end

  def show

    @post = Post.find(params[:id])
    @comment = Comment.new(:post_id => @post.id)

    rescue ActiveRecord::RecordNotFound
    flash[:error] = "The post doesn't exist."
    redirect_to root_path

  end

  def last
    @posts = Post.newer_posts(params[:num])
  end

end
