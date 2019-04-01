require 'rails_helper'

describe UserInfoFactory, type: :model do
  before do
    @request = double('request')
    expect(@request).to receive(:user_agent).and_return('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4 '\
                                                        'AppleWebKit/537.36 (KHTML, like Gecko) '\
                                                        'Chrome/66.0.3359.181 Safari/537.36')
    expect(@request).to receive(:remote_ip).and_return('127.0.0.1')
    expect(@request).to receive(:referer).and_return('http://localhost:3000/')
    expect(@request).to receive(:from).and_return(nil)
  end

  let(:short_url) { create(:short_url) }

  it 'should create UserInfo' do
    expect{ UserInfoFactory.create(short_url, @request) }.to change(UserInfo, :count).by(1)
  end

  it 'should set ShortUrl for UserInfo' do
    user_info = UserInfoFactory.create(short_url, @request)
    expect(user_info.short_url).to eq short_url
  end
end