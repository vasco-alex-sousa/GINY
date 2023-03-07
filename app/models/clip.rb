class Clip < ApplicationRecord
  belongs_to :stream

  def self.best_clips(period)
    where(created_at: period).order(view_count: :desc).first(5)
  end
end
