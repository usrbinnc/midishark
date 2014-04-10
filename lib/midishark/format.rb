module Midishark
  class Format
    def initialize(parser, transformer, outputter, stdin = STDIN)
      @parser = parser
      @transformer = transformer
      @outputter = outputter

      @stdin = stdin
    end

    def run!
      while line = @stdin.gets
        input = @parser.parse(line)

        unless input.nil?
          messages = Array(@transformer.transform(input))

          messages.each do |message|
            puts @outputter.output(message)
          end
        end
      end
    end
  end
end
