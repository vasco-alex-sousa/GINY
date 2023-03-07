class Category < ApplicationRecord
  has_many :streams
  has_many :clips, through: :streams

  def best_clips(period)
    clips.where(created_at: period).order(view_count: :desc).first
  end

  def best_streams(period)
    streams.where(created_at: period).order(average_viewers: :desc).first
  end
end
