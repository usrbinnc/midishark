module Midishark
  module Parser
    # instrument is a number between 0 and N
    # velocity is between 0 and 127
    # duration is in microseconds
    # tone is the MIDI note number to play
    class Result < Struct.new(:instrument, :velocity, :duration, :tone)
    end
  end
end
