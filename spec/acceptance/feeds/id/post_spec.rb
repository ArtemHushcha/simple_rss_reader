require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Feeds' do
  explanation 'Feed resource'

  header 'Accept', 'application/json'

  post '/api/v1/feeds' do
    route_summary 'POST /api/v1/feeds'

    with_options scope: :feed, with_example: true do
      parameter :url, 'The feed URL', required: true
    end

    let(:url) { 'http://feeds.bbci.co.uk/news/world/rss.xml' }
    let(:feed) { Feed.last }
    let(:expected_response) do
      {
        'id' => feed.id,
        'url' => url,
        'title' => nil
      }
    end
    let(:params) do
      { feed: { url: url } }
    end

    context '201' do
      example 'POST /api/v1/feeds 201' do
        do_request(params)

        expect(status).to eq(201)
        expect(JSON.parse(response_body)).to eq(expected_response)
      end
    end

    context '422' do
      example_request 'POST /api/v1/feeds 422' do
        do_request
        expect(status).to eq(422)
      end
    end
  end
end
