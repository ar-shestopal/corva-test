require 'rails_helper'

RSpec.describe Api::V1::RequestsController, type: :controller do
  # In general request spec is enough but I added controller specs as some team like writing them.
  describe "POST #create" do
    it "returns http success" do
      post :create, params: {request_id: 1}, format: :json
      expect(response).to have_http_status(:success)
    end
  end
end
