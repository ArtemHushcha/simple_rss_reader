require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Feeds' do
  explanation 'Feed resource'

  header 'Accept', 'application/json'

  get '/api/v1/feeds' do
    route_summary 'GET /api/v1/feeds'

    let!(:feed1) { create(:feed, url: 'http://www.ruby-lang.org/en/feeds/news.rss') }
    let!(:feed2) { create(:feed, url: 'http://feeds.bbci.co.uk/news/world/rss.xml') }
    let(:expected_response) do
      [
        {
          'id' => feed2.id,
          'url' => feed2.url,
          'title' => feed2.title
        },
        {
          'id' => feed1.id,
          'url' => feed1.url,
          'title' => feed1.title
        }
      ]
    end

    context '200' do
      example 'GET /api/v1/feeds' do
        do_request({})

        expect(status).to eq(200)
        expect(JSON.parse(response_body)).to eq(expected_response)
      end
    end
  end
end
