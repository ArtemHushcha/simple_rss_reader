# API controller for Feeds with all CRUD actions

module Api
  module V1
    class FeedsController < ApplicationController
      before_action :set_feed, only: %i[show update destroy]

      # GET /feeds
      def index
        @feeds = Feed.all

        render json: @feeds.recent, status: 200
      end

      # GET /feeds/1
      def show
        render json: @feed, status: 200
      end

      # POST /feeds
      def create
        result = FeedSave.call(attrs: feed_params, feed: nil)

        if result.success?
          render json: result.feed, status: 201
        else
          render json: { error: result.message }, status: 422
        end
      end

      # PATCH/PUT /feeds/1
      def update
        result = FeedSave.call(attrs: feed_params, feed: @feed)

        if result.success?
          render json: result.feed, status: 200
        else
          render json: { error: result.message }, status: 422
        end
      end

      # DELETE /feeds/1
      def destroy
        @feed.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_feed
        @feed = Feed.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def feed_params
        params.require(:feed).permit(:url)
      end
    end
  end
end
