require "rails_helper"

RSpec.describe 'API::V1::Requests', :type => :request do
  let(:headers) { { 'ACCEPT' => 'application/json' } }
  let(:response_body) { JSON.parse(response.body) }
  let(:request_id) { '123456' }
  let(:params) { {} }

  subject { post "/api/v1/#{request_id}/requests.json", params: params, headers: headers }

  it 'return response with request_id sent via params' do
    subject
    expect(response_body['request_id']).to eq(request_id)
  end


end