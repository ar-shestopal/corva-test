require "rails_helper"

RSpec.describe 'API::V1::ShortUrls', :type => :request do
  before do
    create(:short_url, :with_user_infos)
  end

  let(:serialized) do
    ActiveModel::SerializableResource.new(ShortUrl.all,
                                          each_serializer: ShortUrlSerializer).to_json
  end

  it 'returns ShortUrls with UserInfos json' do
    headers = {
        "ACCEPT" => "application/json"
    }

    get '/api/v1/short_urls.json', params: {}, headers: headers

    expect(response.body).to eq(serialized)
  end
end