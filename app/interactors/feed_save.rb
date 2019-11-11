# frozen_string_literal: true

# Save Feed:
# * Get title of real RSS feed
# * Create/Update Feed
#

class FeedSave
  include Interactor

  def call
    xml = HTTParty.get(context.attrs[:url]).body
    rss_feed = Feedjira.parse(xml)
    save_feed(rss_feed)
  rescue StandardError
    context.fail!(message: 'RSS URL is not valid')
  end

  private

  delegate :attrs, to: :context

  def save_feed(rss_feed)
    context.feed ||= Feed.new(attrs)
    context.feed.title = rss_feed.title
    context.feed.url = attrs[:url]
    context.feed.save!
  end
end
