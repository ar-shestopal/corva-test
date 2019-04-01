class Api::V1::RequestsController < ApplicationController
  # As application should respond to json request, I decided to add API V1 namespace to controller,
  # because usually json is used in API and it wil lallow better flexibility

  def create
    render json: { success: true }
  end
end
