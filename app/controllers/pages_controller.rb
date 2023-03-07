class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # Resumed overview of user's stats
    # Recommended channels and categories
  end

  def search
    # Discover Categories/Streamers from Twitch
  end

  def discover
    # Detailed stats from Twitch
    # Best content recommendations
  end
end
