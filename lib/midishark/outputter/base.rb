module Midishark
  module Outputter
    class Base
      # Public: Takes a parser result, and formats it for output.
      #
      # Abstract method, should be implemented in the base class.
      def output(parser_result)
        raise NotImplementedError, "please implement #output in #{self.class}"
      end
    end
  end
end
