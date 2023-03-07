class ClipsController < ApplicationController
  def index
    @clips = Clip.order(view_count: :desc).sort_by { rand }
  end
end
