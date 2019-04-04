class Api::V1::RequestsController < ApplicationController
  # As application should respond to json request, I decided to add API V1 namespace to controller,
  # because usually json is used in API and it wil lallow better flexibility

  # Theere are lots of ways to validate parms, like https://github.com/nicolasblanco/rails_param, https://json-schema.org/
  # I use custom one for simplicity
  before_action :validate_params, only: :compute

  def compute
    result = Compute::ComputeService.new(@compute_params[:data]).compute

    render json: ResultPresenter.new(timestamp: @compute_params[:timestamp], result: result, )
  end

  private

  def validate_params
    @compute_params = Compute::ComputeParams.new(params)
    render json: { error: @compute_params.error }, status: :bad_request unless @compute_params.valid?
  end
end
