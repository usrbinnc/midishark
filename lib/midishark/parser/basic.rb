require 'ostruct'

module Midishark
  module Parser
    class Basic < Base
      @@ip_match = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
      @@full_match = /^(#{@@ip_match})\s+(#{@@ip_match})\s+(\d+)\s+(\d+)$/

      # Public: Parses a basic input line in the format of:
      #
      #   <srcip> <dstip> <srcport> <dstport>
      def parse(line)
        line.strip!

        match = line.match(@@full_match)
        return unless match

        source_ip, destination_ip, source_port, destination_port = match[1..4]

        OpenStruct.new(
          :source_ip => source_ip,
          :destination_ip => destination_ip,
          :source_port => source_port.to_i,
          :destination_port => destination_port.to_i
        )
      end
    end
  end
end
