module Midishark
  module Transformer
    class MappedClient < Base
      def initialize(config)
        super
        @clients = {}
      end

      # Public: maps an IP to an instrument, and outputs two notes:
      #
      # One for the src ip and one for the dest ip.
      def transform(input)
        [
          transform_for(input.destination_ip, input.destination_port),
          transform_for(input.source_ip, input.source_port)
        ]
      end

    private

      def transform_for(ip, port)
        # Assign client to instrument if needed.
        add_client_if_needed(ip)

        # Grab the instrument for this IP.
        instrument = instrument_for(ip)

        # Set the velocity to be based on the port.
        velocity = ((1.0 - (port / 65536.0)) * 127).to_i

        # Grab random note/chord and a duration for the note.
        tone = instrument.random_note
        duration = instrument.random_duration

        build_result(instrument.device, velocity, duration, tone)
      end

      def instrument_for(ip)
        index = @clients[ip] % config.instruments.size
        config.instruments[index]
      end

      def add_client_if_needed(ip)
        unless @clients.has_key?(ip)
          @clients[ip] = @clients.size
        end
      end
    end
  end
end
