module Midishark
  class Cli
    def initialize(config, args = ARGV)
      @config = config
      @args = args
    end

    def run!
      case @args.first
      when 'capture'
        capture!
      when 'format'
        format!
      else
        abort "Unknown command: #{@args.first}"
      end
    end

  private

    def format!
      parser = @config.parser.new(@config)
      transformer = @config.transformer.new(@config)
      outputter = @config.outputter.new

      Midishark::Format.new(parser, transformer, outputter).run!
    end

    def capture!
      Midishark::Wireshark.new(@config.tshark_command).exec_process!
    end
  end
end
