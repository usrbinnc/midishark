require 'spec_helper'

describe Midishark::Transformer::MappedClient do
  let(:instrument1) do
    double(:instrument1, :device => 0, :random_note => [56], :random_duration => 500000)
  end

  let(:instrument2) do
    double(:instrument2, :device => 1, :random_note => [49], :random_duration => 100000)
  end

  let(:config) do
    double(
      :config,
      :instruments => [instrument1, instrument2]
    )
  end

  subject { described_class.new(config) }

  def build_input(src_ip, dest_ip, src_port, dest_port)
    double(
      :parse_result,
      :source_ip => src_ip,
      :destination_ip => dest_ip,
      :source_port => src_port,
      :destination_port => dest_port
    )
  end

  describe '#transform' do
    let(:input) do
      build_input('192.168.0.1', '192.168.0.2', 10000, 50000)
    end

    it "should output two messages" do
      messages = subject.transform(input)

      expect(messages).to eq([
        Midishark::Transformer::Result.new(0, 30, 500000, [56]),
        Midishark::Transformer::Result.new(1, 107, 100000, [49])
      ])
    end
  end
end
