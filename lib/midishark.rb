module Midishark
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
