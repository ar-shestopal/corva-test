module Compute
  class ComputeService
    def initialize(data)
      @data = data
    end

    def compute
      wrapped_values = wrap_values_arrays
      wrapped_values.reduce(:-)
    end

    private

    attr_reader :data

    def wrap_values_arrays
      data.map { |req| ValuesArrayWrapper.new(req[:values]) }
    end

    # Wrapper for values array
    # Implements ValuesArrayWrapper#- method to subtract one  array from other element by element
    # Can be moved to an external class at any moment
    class ValuesArrayWrapper
      def initialize(values)
        @values = values.map! { |val| val.to_i }
      end

      def -(other)
        other_values = other.values

        #inplace changes for better performance
        values.each_with_index do |val, index|
          other_val = other_values[index]
          break unless other_val
          values[index] = val - other_val
        end
        values
      end

      protected

      attr_reader :values
    end
  end
end