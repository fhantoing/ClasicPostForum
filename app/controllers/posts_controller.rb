class PostsController < ApplicationController

  def index
    #@posts = Post.order("created_at DESC").all
    @posts = Post.all.to_a
  end


end
