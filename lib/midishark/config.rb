module Midishark
  class Config
    attr_accessor :tshark_command
    attr_accessor :output_formatter

    def initialize
      # Set defaults.
      self.output_formatter = Midishark::Outputter::Streamy
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
      new.tap { |config| yield config }
    end
  end
end
