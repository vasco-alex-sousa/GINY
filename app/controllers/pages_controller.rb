class PagesController < ApplicationController
  def home
    @user = current_user
    @streams = Stream.all
    @all_categories = Category.all
    @clips = Clip.all

    @last_week_top_categories = @all_categories.sort_by { |category| -category.average_viewers }.take(5)
    @last_week_top_channels = @streams.sort_by { |stream| -stream.average_viewers }.take(5).map(&:user).uniq
    @last_week_top_categories_clips = @last_week_top_categories.map { |category| category.clips.order("view_count DESC").first }
    @last_week_top_channels_clips = @last_week_top_channels.map { |user| user.clips.order("view_count DESC").first }

    @categories = Category.order(average_viewers: :desc).limit(5)
    @channels = User.joins(:streams).select("users.*, MAX(streams.viewer_count) as viewer_count").group("users.id").order("viewer_count desc").limit(10)

  end

  def discover
    @users = User.where.not(id: current_user.id).order("RANDOM()").limit(30)
  end

  def upcoming
    @channels = User.joins(:streams).select("users.*, MAX(streams.viewer_count) / users.follower_count AS performance_score")
                    .group("users.id").order("performance_score DESC").limit(10)
  end

end
