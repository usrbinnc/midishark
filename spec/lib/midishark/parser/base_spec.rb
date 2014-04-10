require 'spec_helper'

describe Midishark::Parser::Base do
  let(:config) { double(:config) }

  subject { described_class.new(config) }

  describe '#parse' do
    it "should raise NotImplementedError" do
      expect { subject.parse('line') }.to raise_error(NotImplementedError)
    end
  end
end
