require 'spec_helper'

describe Midishark::Config do
  describe '::build' do
    it "should create a new config and yield it" do
      config = described_class.build do |c|
        c.tshark_command = 'ok'
      end

      expect(config.tshark_command).to eq('ok')
    end
  end

  describe '#tshark_command' do
    it "should return a value for tshark_command if possible" do
      subject.tshark_command = 'tshark_command -ien0'
      expect(subject.tshark_command).to eq('tshark_command -ien0')
    end
  end
end
