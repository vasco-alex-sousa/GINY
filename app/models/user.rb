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
end
