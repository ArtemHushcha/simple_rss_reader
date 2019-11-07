class HomeController < ApplicationController
  def index
    @feeds = Feed.all
    render json: @feeds.recent, status: 200
  end
end
