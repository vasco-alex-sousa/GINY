class ClipsController < ApplicationController
  def index
    @clips = Clip.all
  end
end
