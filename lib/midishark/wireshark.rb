module Midishark
  class Wireshark
    def initialize(command)
      @command = command
    end

    def exec_process!
      exec(@command)
    end
  end
end
