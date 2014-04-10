module Midishark
  class Config
    attr_reader :instruments

    def initialize
      formatter Midishark::Outputter::Streamy

      @instruments = []
    end

    # Public: sets/gets the tshark command to run when the `midishark wireshark`
    # command is executed.
    #
    #   tshark_command "tshark -args -args -args"
    #
    def tshark_command(value = nil)
      setget(:@tshark_command, value)
    end

    def instrument(&block)
      instrument = Instrument.new
      instrument.instance_eval(&block)

      @instruments << instrument

      instrument
    end

    # Public: sets the klass of the formatter we want to use.
    #
    #   formatter Midishark::Outputter::Streamy
    #
    def formatter(value = nil)
      setget(:@formatter, value)
    end

    # Public: creates a new Config object and yields it to the block.
    #
    # Usage:
    #
    #   cfg = Midishark::Config.build do |config|
    #     config.tshark_command = "tshark -ien0"
    #
    #     # etc...
    #   end
    def self.build(&block)
      new.tap { |config| config.instance_eval(&block) }
    end

    class Instrument
      attr_reader :notes

      def initialize
        @notes = []
      end

      def min_duration(value = nil)
        setget(:@min_duration, value)
      end

      def max_duration(value = nil)
        setget(:@max_duration, value)
      end

      def device(value = nil)
        setget(:@device, value)
      end

      # Public: returns a random duration between min/max.
      def random_duration
        min_duration + rand(max_duration - min_duration + 1)
      end

      # Public: adds a possible note to an instrument's bag of notes.
      def note(*note_names)
        midi_values = note_names.map { |name| Midishark::Notes.note(name) }
        @notes << midi_values

        midi_values
      end

    private

      def setget(variable, value)
        # I understand the error of my ways, and I will go fuck myself.
        instance_variable_set(variable, value) unless value.nil?
        instance_variable_get(variable)
      end
    end

  private

    def setget(variable, value)
      # I understand the error of my ways, and I will go fuck myself.
      instance_variable_set(variable, value) unless value.nil?
      instance_variable_get(variable)
    end
  end
end
