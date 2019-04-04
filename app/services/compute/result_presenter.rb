module Compute
  class ResultPresenter
    def initialize(timestamp:, request_id:, result:)
      @timestamp = timestamp
      @request_id = request_id
      @result = result
    end

    def to_json
      { request_id: request_id, timestamp: timestamp, title: 'Result', result: result }
    end

    private

    attr_reader :request_id, :timestamp, :result
  end
end