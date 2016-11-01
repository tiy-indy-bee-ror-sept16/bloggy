class RejoinersController < ApplicationController

  before_action :require_login, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @rejoiner = @post.rejoiners.new(rejoiner_params)
    @rejoiner.user = current_user
    if @rejoiner.save
      flash[:success] = "Consider it rejoined!"
      redirect_to @post
    else
      flash[:danger] = "That didn't save."
      redirect_to :back
    end
  end


  private

  def rejoiner_params
    params.require(:rejoiner).permit(:body)
  end

end
