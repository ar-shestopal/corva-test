require "rails_helper"

RSpec.describe Api::V1::ShortUrlsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/short_urls.json').to route_to(controller: 'api/v1/short_urls',
                                                         action: 'index', format: 'json')
    end
  end
end
