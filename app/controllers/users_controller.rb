class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # Stats from Twitch
    # Clips from Twitch Streamer
  end
end
