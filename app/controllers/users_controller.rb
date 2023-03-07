class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # Stats from Twitch =
    # @twitch_stats = TwitchApi.get_stats(@user.twitch_username)
    # Clips from Twitch Streamer =
    # @twitch_clips = TwitchApi.get_clips(@user.twitch_username)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.uptade(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :twitch_username)
  end
end
