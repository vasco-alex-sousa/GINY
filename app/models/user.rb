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
end
