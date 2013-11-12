class CommentsController < ApplicationController

  def create

    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])

    respond_to do |format|
        if @comment.save
          format.html {
            flash[:success] = "Comment created successfully."
            redirect_to @post
          }
          format.js
        else
          format.html {
            flash[:error] = "Comment needs an author and content."
            render 'posts/show'
          }
        end
    end

  end

end
