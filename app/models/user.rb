class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :streams
  has_many :clips, through: :streams

  def user_stats(period)
    streams.where(created_at: period.start_date..period.end_date).pluck(:viewer_count, :number_of_chat_messages, :new_followers, :new_subscriptions).transpose.map(&:sum)
  end

  def best_user_clip(period)
    clips.where(created_at: period.start_date..period.end_date).order(view_count: :desc).first
  end

  def average(num_of_streams)
    i = 0
    counter = 0
    streams.last(num_of_streams).each do |stream|
      i += 1
      counter += stream.average_viewers
    end
    (counter.to_f / i).round
  end

  def followers(num_of_streams)
    i = 0
    counter = 0
    streams.last(num_of_streams).each do |stream|
      i += 1
      counter += stream.new_followers
    end
    counter
  end

  def subscribers(num_of_streams)
    i = 0
    counter = 0
    streams.last(num_of_streams).each do |stream|
      i += 1
      counter += stream.new_subscriptions
    end
    counter
  end

  def num_chat_msg(num_of_streams)
    i = 0
    counter = 0
    streams.last(num_of_streams).each do |stream|
      i += 1
      counter += stream.number_of_chat_messages
    end
    (counter.to_f / i).round
  end

  def num_chatters(num_of_streams)
    i = 0
    counter = 0
    streams.last(num_of_streams).each do |stream|
      i += 1
      counter += stream.unique_chatters
    end
    (counter.to_f / i).round
  end

  def max_peak_viewers(num_of_streams)
    streams.last(num_of_streams).map(&:peak_viewers).max
  end


  def last_streams(num_streams)
    streams.order(started_at: :desc).limit(num_streams)
  end

  def top_categories
    category_count = streams.where("created_at >= ?", 30.days.ago).group(:category_id).count
    category_count.sort_by { |_, count| -count }.take(3).map(&:first)
  end
end
