class PostsController < ApplicationController

  def index
    @posts = Post.all.to_a
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:success] = "Post created successfully."
      redirect_to root_path
    else
      render 'posts/create'
      flash[:error] = "Post title, content and author are required."
    end
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
