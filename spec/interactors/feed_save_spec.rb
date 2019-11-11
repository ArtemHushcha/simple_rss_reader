# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeedSave do
  subject :context do
    described_class.call(
      attrs: attrs,
      feed: feed
    )
  end

  let(:url) { 'http://feeds.bbci.co.uk/news/world/rss.xml' }
  let(:attrs) { { url: url } }
  let(:feed_title) { 'BBC News - World' }

  before :each do
    stub_request(:get, url)
      .to_return(
        status: 200,
        body: file_fixture('rss_feed_sample.xml').read,
        headers: {}
      )
  end

  describe 'succeeds' do
    context 'update' do
      let(:feed) { create(:feed, url: 'http://www.ruby-lang.org/en/feeds/news.rss') }

      it 'set correct feed title' do
        expect(context.feed.title).to eq feed_title
      end
    end

    context 'create' do
      let(:feed) { nil }

      it 'set correct feed title' do
        expect(context.feed.title).to eq feed_title
      end
    end
  end

  describe 'fails' do
    context 'update' do
      let(:url) { 'wrong URL' }
      let(:feed) { create(:feed, url: 'also wrong URL') }

      it 'raire exception' do
        expect(context.message).to eq('RSS URL is not valid')
      end
    end

    context 'create' do
      let(:feed) { nil }
      let(:url) { 'wrong URL' }

      it 'raire exception' do
        expect(context.message).to eq('RSS URL is not valid')
      end
    end
  end
end
