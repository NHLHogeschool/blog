class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all

    render json: @comments
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(params[:comment])
    if comment.save
      redirect_to post
    end
  end

  def update
    comment = Comment.find(params[:id])
    comment.update_attributes(params[:comment])
    render nothing: true
  end
end
