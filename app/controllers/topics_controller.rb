class TopicsController < ApplicationController

  def show
    @topic = Topic.find_by(name: params[:id])
  end

end
