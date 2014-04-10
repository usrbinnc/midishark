require 'ostruct'

module Midishark
  module Parser
    class Basic < Base
      @@starts_with_ip = /^\d{1,3}\./

      # Public: Parses a basic input line in the format of:
      #
      #   <srcip> <dstip> <srcport> <dstport>
      def parse(line)
        line.strip!
        return unless line =~ @@starts_with_ip

        fields = line.split(/\s+/).compact

        return unless fields.size >= 4

        source_ip, destination_ip, source_port, destination_port = fields

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
