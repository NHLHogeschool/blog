class CommentsController < ApplicationController
  def index
    render json: Post.find(params[:post_id]).comments.all
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(params[:comment])
    if comment.save
      redirect_to post
    end
  end
end
