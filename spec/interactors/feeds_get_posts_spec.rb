# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeedsGetPosts do
  subject :context do
    described_class.call
  end

  let(:url) { 'http://www.ruby-lang.org/en/feeds/news.rss' }
  let!(:feed) { create(:feed, url: url) }

  before :each do
    stub_request(:get, url)
      .to_return(
        status: 200,
        body: file_fixture('rss_feed_sample_with_entries.xml').read,
        headers: {}
      )
  end

  describe 'succeeds' do
    let(:expected_response) do
      [
        {
          'title' => 'Ruby 2.7.0-preview2 Released',
          'url' => 'https://www.ruby-lang.org/en/news/2019/10/22/ruby-2-7-0-preview2-released/',
          'published' => '2019-10-22 12:00:00 UTC'
        },
        {
          'title' => 'CVE-2019-16254: HTTP response splitting in WEBrick (Additional fix)',
          'url' => 'https://www.ruby-lang.org/en/news/2019/10/01/http-response-splitting-in-webrick-cve-2019-16254/',
          'published' => '2019-10-01 12:00:00 UTC'
        }
      ]
    end

    it 'provides the feeds posts' do
      expect(context.posts).to eq expected_response
    end
  end
end
