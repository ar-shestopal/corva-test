require "rails_helper"

RSpec.describe 'API::V1::Requests', :type => :request do
  let(:response_body) { JSON.parse(response.body) }
  let(:request_id) { '123456' }
  let(:timestamp) { '12973979797979' }
  let(:params) do
    { timestamp: timestamp,
      data: [
        { 'title': 'Title1', values: [1, 2, 3] },
        { 'title': 'Title2', values: [1, 1, 1] }
      ]
    }
  end

  subject { post "/compute/#{request_id}", params: params, as: :json }

  shared_examples 'request with invalid params' do |invalid_param|
    it 'should return bad request status' do
      subject
      expect(response).to have_http_status(:bad_request)
    end

    it 'should return error message' do
      subject
      expect(response_body['error']).to eq "Incorrect parameters format,"\
                                           " param is missing or the value is empty: #{invalid_param}"
    end
  end

  describe 'validate params' do
    context '#valid params' do
      it 'should respond with success status' do
        subject
        expect(response).to have_http_status(:success)
      end
    end

    context '#invalid params' do
      context 'no timestamp' do
        let(:params) { {} }

        it_behaves_like 'request with invalid params', :timestamp
      end

      context 'no data' do
        let(:params) { { timestamp: '1234567' } }

        it_behaves_like 'request with invalid params', :data
      end

      context 'no title in data item' do
        let(:params) { { timestamp: '1234567', data: [ { values: [] } ] } }

        it_behaves_like 'request with invalid params', :title
      end
    end

    context 'no values in data item' do
      let(:params) { { timestamp: '1234567', data: [ { title: 'Title1' } ] } }

      it_behaves_like 'request with invalid params', :values
    end
  end

  describe 'response structure' do
    it 'return response with request_id sent via params' do
      subject
      expect(response_body['request_id']).to eq(request_id)
      expect(response_body['timestamp']).to eq(timestamp)
      expect(response_body['result']).to eq([0, 1, 2])
      expect(response_body['title']).to eq "Result"
    end
  end
end