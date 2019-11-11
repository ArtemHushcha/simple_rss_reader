# API controller for Feeds with all CRUD actions

module Api
  module V1
    class PostsController < ApplicationController
      # GET /posts
      def index
        result = FeedsGetPosts.call
        render json: result.posts, status: 200
      end
    end
  end
end
