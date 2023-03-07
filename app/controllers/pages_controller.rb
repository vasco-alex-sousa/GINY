class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      # Resumed overview of user's stats
      @user_streams = current_user.streams
      @average_viewers = @user_streams.average(:average_viewers)
      @peak_viewers = @user_streams.maximum(:peak_viewers)
      @number_of_followers = @user_streams.sum(:new_followers)
      @number_of_subscriptions = @user_streams.sum(:new_subscriptions)

      # Recommended channels
      categories = current_user.streams.joins(:category).pluck(:'categories.name').uniq
      @similar_streamers = Stream.joins(:user, :category)
                                 .where.not(user_id: current_user.id)
                                 .where('categories.name IN (?)', categories)
                                 .select('users.username, categories.name, streams.average_viewers, streams.peak_viewers')
                                 .order('streams.average_viewers DESC')
                                 .limit(5)

      # Recommended categories
      last_category_id = current_user.streams.last.category_id
      @similar_categories = Category.where.not(id: last_category_id)
                                    .select('name, average_viewers, peak_viewers, rank')
                                    .order('average_viewers DESC')
                                    .limit(5)
    else
      # Recommended channels
      @popular_streamers = Stream.joins(:user)
                                 .select('users.username, streams.average_viewers, streams.peak_viewers')
                                 .order('streams.average_viewers DESC')
                                 .limit(5)

      # Recommended categories
      @popular_categories = Category.select('name, average_viewers, peak_viewers, rank')
                                    .order('average_viewers DESC')
                                    .limit(5)
    end
  end

  def search
    # Discover Categories/Streamers from Twitch
  end

  def discover
    # Detailed stats from Twitch
    # Best content recommendations
  end
end
