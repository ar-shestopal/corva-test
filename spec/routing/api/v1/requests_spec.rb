require "rails_helper"

RSpec.describe Api::V1::RequestsController, type: :routing do
  describe 'routing' do
    let(:headers) { { "ACCEPT" => "application/json" } }

    it 'routes to #create' do
      expect(post: '/compute/1.json', headers: headers ).to route_to(controller: 'api/v1/requests',
                                                                     action: 'create', request_id: '1', format: 'json')
    end
  end
end
