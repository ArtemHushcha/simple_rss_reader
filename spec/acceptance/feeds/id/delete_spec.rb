require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Feeds' do
  explanation 'Feed resource'

  header 'Accept', 'application/json'

  delete '/api/v1/feeds/:id' do
    route_summary 'PUT /api/v1/feeds/:id'

    with_options scope: :feed, with_example: true do
      parameter :url, 'The feed URL', required: true
    end

    let!(:feed) { create(:feed, url: 'http://www.ruby-lang.org/en/feeds/news.rss') }

    context '204' do
      let(:id) { feed.id }

      example_request 'DELETE /api/v1/feeds/:id 200' do
        expect(status).to eq(204)
      end
    end

    context '404' do
      let(:id) { 0 }

      example_request 'DELETE /api/v1/feeds/:id 404' do
        expect(status).to eq(404)
      end
    end
  end
end
