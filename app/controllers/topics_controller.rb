class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def index
    @topics = Topic.all.includes([:favorite_users, :comment_users])
  #   @topics = Topic.all.includes(:favorite_users)
  #   @comments = Comment.all

  # logger.debug("debug1--")
  # @topics.each do |value|
  #   p value.comments
  # end
  # logger.debug("--debug1")

  end

  def create
	logger.debug(current_user)
	puts current_user
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end