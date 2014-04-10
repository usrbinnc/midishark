module Midishark
  module Outputter
    class Streamy < Midishark::Outputter::Base
      # Public: formats output for Streamy.
      #
      # The output format is: "instrument velocity duration tone"
      def output(parser_result)
        [
          parser_result.instrument,
          parser_result.velocity,
          parser_result.duration,
          parser_result.tone.join(',')
        ].join(' ')
      end
    end
  end
end
