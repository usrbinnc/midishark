require 'spec_helper'

describe Midishark::Outputter::Streamy do
  describe '#output' do
    let(:result) do
      double(
        :parser_result,
        :instrument => 1,
        :velocity => 56,
        :duration => 4000,
        :tone => 99
      )
    end

    it "should output the correct Streamy format" do
      output = subject.output(result)
      expect(output).to eq("1 56 4000 99")
    end
  end
end
