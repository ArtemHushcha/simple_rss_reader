require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Feeds' do
  explanation 'Feed resource'

  header 'Accept', 'application/json'

  put '/api/v1/feeds/:id' do
    route_summary 'PUT /api/v1/feeds/:id'

    with_options scope: :feed, with_example: true do
      parameter :url, 'The feed URL', required: true
    end

    let!(:feed) { create(:feed, url: 'http://www.ruby-lang.org/en/feeds/news.rss') }
    let(:new_url) { 'http://feeds.bbci.co.uk/news/world/rss.xml' }
    let(:expected_response) do
      {
        'id' => feed.id,
        'url' => new_url,
        'title' => feed.title
      }
    end
    let(:params) do
      { feed: { url: new_url } }
    end

    context '200' do
      let(:id) { feed.id }

      example 'PUT /api/v1/feeds/:id 200' do
        do_request(params)

        expect(status).to eq(200)
        expect(JSON.parse(response_body)).to eq(expected_response)
      end
    end

    context '404' do
      let(:id) { 0 }

      example_request 'PUT /api/v1/feeds/:id 404' do
        expect(status).to eq(404)
      end
    end
  end
end
