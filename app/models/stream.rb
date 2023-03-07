class Stream < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :clips
end
