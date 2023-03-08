class PagesController < ApplicationController
  def home
    @user = current_user
    @streams = Stream.all
    @categories = Category.all
    @clips = Clip.all

    @last_week_top_categories = @categories.sort_by { |category| -category.average_viewers }.take(5)
    @last_week_top_channels = @streams.sort_by { |stream| -stream.average_viewers }.take(5).map(&:user).uniq
    @last_week_top_categories_clips = @last_week_top_categories.map { |category| category.clips.order("view_count DESC").first }
    @last_week_top_channels_clips = @last_week_top_channels.map { |user| user.clips.order("view_count DESC").first }

    @categories = Category.order(average_viewers: :desc)
    @channels = User.joins(:streams).select("users.*, AVG(streams.average_viewers) as average_viewers").group("users.id").order("average_viewers desc").limit(10)
  end

  def discover
    @users = User.order("RANDOM()").limit(30)
  end
end
