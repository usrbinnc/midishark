module Midishark
  # Public: creates a config object and runs in CLI mode.
  def self.configure(&block)
    config = Midishark::Config.build(&block)

    Midishark::Cli.new(config, ARGV.dup).run!
  end
end

require "midishark/version"
require 'midishark/config'
require 'midishark/notes'

require 'midishark/parser/base'
require 'midishark/parser/basic'

require 'midishark/transformer/result'

require 'midishark/outputter/base'
require 'midishark/outputter/streamy'

require 'midishark/wireshark'
require 'midishark/cli'
