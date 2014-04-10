module Midishark
  module Transformer
    class Base
      def initialize(config)
        @config = config
      end

      # Public: takes an line of parsed input, returned from a
      # Midishark parser.
      def transform(input)
        raise NotImplementedError, "please implement #transform in #{self.class}"
      end

    private

      def config
        @config
      end

      def build_result(*args)
        Midishark::Transformer::Result.new(*args)
      end
    end
  end
end
