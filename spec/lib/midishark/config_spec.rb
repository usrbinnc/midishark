require 'spec_helper'

describe Midishark::Config do
  describe '::build' do
    it "should create a new config and yield it" do
      config = described_class.build do
        tshark_command 'ok'
      end

      expect(config.tshark_command).to eq('ok')
    end
  end

  describe '#tshark_command' do
    it "should return a value for tshark_command if possible" do
      subject.tshark_command('tshark_command -ien0')
      expect(subject.tshark_command).to eq('tshark_command -ien0')
    end
  end

  describe '#instrument' do
    let(:instrument) do
      subject.instrument do
        device 0
        min_duration 2000000
        max_duration 4000000

        note 'D2'
        note 'G1', 'D3', 'B3'  # G maj chord
      end
    end

    it "should allow configuring an instrument" do
      expect(instrument.device).to eq(0)
      expect(instrument.min_duration).to eq(2000000)
      expect(instrument.max_duration).to eq(4000000)
      expect(instrument.notes).to eq([[38], [31, 50, 59]])
    end

    it "should be added to the instruments list" do
      expect(subject.instruments).to eq([instrument])
    end
  end

  describe '#formatter' do
    it "should have a default value" do
      expect(subject.formatter).to eq(Midishark::Outputter::Streamy)
    end

    it "should be settable" do
      subject.formatter(:haha)
      expect(subject.formatter).to eq(:haha)
    end
  end
end

describe Midishark::Config::Instrument do
  describe '#random_note' do
    it "should return a random note from the bag of notes" do
      subject.note 'A1'
      subject.note 'B2'

      100.times do
        expect([[33], [47]]).to include(subject.random_note)
      end
    end
  end

  describe '#random_duration' do
    it "should return a random duration bounded between [min, max]" do
      subject.min_duration 1
      subject.max_duration 2

      100.times do
        expect(1..2).to include(subject.random_duration)
      end
    end
  end
end
