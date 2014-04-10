require 'spec_helper'

describe Midishark::Parser::Basic do
  let(:config) { double(:config) }
  subject { described_class.new(config) }

  describe '#parse' do
    it "should return nil if it doesn't start with an IP" do
      expect(subject.parse('side of fries')).to be_nil
    end

    it "should return nil if it doesn't have all four fields" do
      expect(subject.parse("192.168.0.1 192.168.0.2 1234")).to be_nil
    end

    it "should return a result if there is one available" do
      result = subject.parse("192.168.0.1 192.168.0.2 80 21")

      expect(result.source_ip).to eq('192.168.0.1')
      expect(result.destination_ip).to eq('192.168.0.2')
      expect(result.source_port).to eq(80)
      expect(result.destination_port).to eq(21)
    end
  end
end
