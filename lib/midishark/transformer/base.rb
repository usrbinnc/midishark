module Midishark
  module Transformer
    class Base
      def initialize(config)
        @config = config
      end

    private

      def config
        @config
      end

      def build_result(*args)
        Midishark::Parser::Result.new(*args)
      end
    end
  end
end
