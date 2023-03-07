class Stream < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :clips

  def best_clip(period)
    clips.where(created_at: period.start_date..period.end_date).order(view_count: :desc).first
  end
end
