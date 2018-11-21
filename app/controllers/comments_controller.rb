class CommentsController < ApplicationController
  def index
    @comments = current_user.comments
  end

  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
  end


  def create
  	# puts current_user
    # logger.debug("debug2---")

    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      @comment = Comment.new

      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,:topic_id)
  end

end
