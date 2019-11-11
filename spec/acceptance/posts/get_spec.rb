require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'RSS Posts' do
  explanation 'Post resource'

  header 'Accept', 'application/json'

  get '/api/v1/posts' do
    route_summary 'GET /api/v1/posts'

    let(:url) { 'http://www.ruby-lang.org/en/feeds/news.rss' }
    let!(:feed) { create(:feed, url: url) }
    let(:expected_response) do
      [
        {
          'title' => 'Ruby 2.7.0-preview2 Released',
          'url' => 'https://www.ruby-lang.org/en/news/2019/10/22/ruby-2-7-0-preview2-released/',
          'published' => '2019-10-22T12:00:00.000Z'
        },
        {
          'title' => 'CVE-2019-16254: HTTP response splitting in WEBrick (Additional fix)',
          'url' => 'https://www.ruby-lang.org/en/news/2019/10/01/http-response-splitting-in-webrick-cve-2019-16254/',
          'published' => '2019-10-01T12:00:00.000Z'
        }
      ]
    end

    before :each do
      stub_request(:get, url)
        .to_return(
          status: 200,
          body: file_fixture('rss_feed_sample_with_entries.xml').read,
          headers: {}
        )
    end

    context '200' do
      example 'GET /api/v1/posts' do
        do_request({})

        expect(status).to eq(200)
        expect(JSON.parse(response_body)).to eq expected_response
      end
    end
  end
end
