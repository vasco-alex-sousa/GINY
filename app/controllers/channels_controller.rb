class ChannelsController < ApplicationController
  def index
    @channels = User.all.order(:created_at)
  end

  def show
    @channel = User.find(params[:id])
  end
end
