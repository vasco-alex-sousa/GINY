class ChannelsController < ApplicationController
  def show
    @user = User.find(params[:id])
    category_count = @user.streams.where("created_at >= ?", 30.days.ago).group(:category_id).count
    @top_categories = category_count.sort_by { |_, count| -count }.take(3).map(&:first)
    @user_clips = Clip.includes(stream: :user).where(stream: { user: @user })

    @num_streams = params[:num_streams] || 5
    @streams = @user.last_streams(@num_streams)
  end
end
