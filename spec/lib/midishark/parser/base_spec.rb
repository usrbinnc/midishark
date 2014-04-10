require 'spec_helper'

describe Midishark::Parser::Base do
  let(:config) { double(:config) }

  subject { described_class.new(config) }

  describe '#parse' do
    it "should raise NotImplementedError" do
      expect { subject.parse('line') }.to raise_error(NotImplementedError)
    end
  end

  context "extending parser base" do
    class TestParser < Midishark::Parser::Base
      def parse(line)
        build_result(1, 127, config.duration, 98)
      end
    end

    describe '#parse' do
      before { config.stub(:duration => 5000) }
      let(:parser) { TestParser.new(config) }

      subject { parser.parse('line') }

      its(:instrument) { should eq(1) }
      its(:velocity) { should eq(127) }
      its(:duration) { should eq(5000) }
      its(:tone) { should eq(98) }
    end
  end
end
