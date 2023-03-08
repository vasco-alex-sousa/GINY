class ChannelsController < ApplicationController
  def index
    @user = current_user
    @user_id = current_user.id
    @num_streams = params[:num_streams] || 5
    @streams = @user.last_streams(@num_streams)
  end
end
