module Midishark
  module Parser
    class Base
      def initialize(config)
        @config = config
      end

      # Public: Takes an input line from wireshark and parses it into its various
      # pieces.
      def parse(line)
        raise NotImplementedError, "please implement #parse in #{self.class}"
      end

    private

      def build_result(*args)
        Midishark::Parser::Result.new(*args)
      end

      def config
        @config
      end
    end
  end
end
