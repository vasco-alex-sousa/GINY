class PagesController < ApplicationController
  def home
    @user = current_user
    @streams = Stream.all
    @categories = Category.all
    @clips = Clip.all

  #Last Week
    @average_week = @user.streams.where("started_at >= ?", 1.week.ago).average(:average_viewers).round
    @sum_followers_week = @user.streams.where("started_at >= ?", 1.week.ago).sum(:new_followers)
    @sum_subscribers_week = @user.streams.where("started_at >= ?", 1.week.ago).sum(:new_subscriptions)

  #Last Month
    @average_month = @user.streams.where("started_at >= ?", 1.month.ago).average(:average_viewers).round
    @sum_followers_month = @user.streams.where("started_at >= ?", 1.month.ago).sum(:new_followers)
    @sum_subscribers_month = @user.streams.where("started_at >= ?", 1.month.ago).sum(:new_subscriptions)

  #Last 3 Months
    @average_3months = @user.streams.where("started_at >= ?", 3.months.ago).average(:average_viewers).round
    @sum_followers_3months = @user.streams.where("started_at >= ?", 3.months.ago).sum(:new_followers)
    @sum_subscribers_3months = @user.streams.where("started_at >= ?", 3.months.ago).sum(:new_subscriptions)



  @last_week_top_categories = @categories.sort_by { |category| -category.average_viewers }.take(5)
  @last_week_top_channels = @streams.sort_by { |stream| -stream.average_viewers }.take(5).map(&:user).uniq
  @last_week_top_categories_clips = @last_week_top_categories.map { |category| category.clips.order("view_count DESC").first }
  @last_week_top_channels_clips = @last_week_top_channels.map { |user| user.clips.order("view_count DESC").first }

  @categories = Category.order(average_viewers: :desc).limit(10)
  @channels = User.joins(:streams).select("users.*, AVG(streams.average_viewers) as average_viewers").group("users.id").order("average_viewers desc").limit(10)

  end
end
