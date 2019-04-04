module Compute
  class ComputeParams
    attr_reader :error

    def initialize(params)
      @params = params
      @error = nil
    end

    def [](key)
      params[key]
    end

    def valid?
      return false if error.present?
      check!
      error.blank?
    end

    private

    attr_reader :params

    def check!
      params.require([:request_id, :timestamp, :data])
      params.require(:data)
      params[:data].each do |param|
        param.require([:title, :values])
      end
    rescue ActionController::ParameterMissing => err
      @error = "Incorrect parameters format, #{err}"
    end
  end
end

