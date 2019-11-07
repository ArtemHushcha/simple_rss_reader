require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Feeds' do
  explanation 'Feed resource'

  header 'Accept', 'application/json'

  get '/api/v1/feeds/:id' do
    route_summary 'GET /api/v1/feeds/:id'

    let!(:feed) { create(:feed, url: 'http://www.ruby-lang.org/en/feeds/news.rss') }
    let(:expected_response) do
      {
        'id' => feed.id,
        'url' => feed.url,
        'title' => feed.title
      }
    end

    context '200' do
      let(:id) { feed.id }

      example 'GET /api/v1/feeds/:id 200' do
        do_request({})

        expect(status).to eq(200)
        expect(JSON.parse(response_body)).to eq(expected_response)
      end
    end

    context '404' do
      let(:id) { 0 }

      example_request 'GET /api/v1/feeds/:id 404' do
        expect(status).to eq(404)
      end
    end
  end
end
