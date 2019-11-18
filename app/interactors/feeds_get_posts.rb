# frozen_string_literal: true

# Get Feeds Posts:
# filtered by (title url published) feed attrs
# sorted by *published*
#

class FeedsGetPosts
  include Interactor

  def call
    process_feeds_posts
    sort_feeds_posts
  end

  private

  def process_feeds_posts
    context.posts = []
    Feed.find_each do |feed|
      HTTParty.get(feed.url).body
              .then { |xml| Feedjira.parse(xml) }
              .then { |rss_feed| context.posts += filtered_feed_attrs(rss_feed) }
    end
  end

  def sort_feeds_posts
    context.posts.sort_by! { |h| h.dig(:published) || Date.new(1) }.reverse!
  end

  def filtered_feed_attrs(rss_feed)
    rss_feed.entries.pluck(:title, :url, :published).map do |entry|
      {
        feed_title: rss_feed.title,
        title: entry[0],
        url: entry[1],
        published: entry[2]
      }
    end
  end
end
