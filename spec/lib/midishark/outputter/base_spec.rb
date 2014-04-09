require 'spec_helper'

describe Midishark::Outputter::Base do
  describe '#output' do
    it "should be abstract" do
      expect { subject.output(nil) }.to raise_error(NotImplementedError)
    end
  end
end
