# frozen_string_literal: true

RSpec.describe Noray::Color do # rubocop:disable Metrics/BlockLength
  describe '#+' do
    it 'adds two colors' do
      c1 = described_class.new(0.9, 0.6, 0.75)
      c2 = described_class.new(0.7, 0.1, 0.25)
      expect(c1 + c2).to eq(described_class.new(1.6, 0.7, 1.0))
    end
  end

  describe '#-' do
    it 'subtracts one color from another' do
      c1 = described_class.new(0.9, 0.6, 0.75)
      c2 = described_class.new(0.7, 0.1, 0.25)
      expect(c1 - c2).to eq(described_class.new(0.20000000000000007, 0.5, 0.5))
    end
  end

  describe '#scale' do
    it 'scales by a scalar' do
      c = described_class.new(0.2, 0.3, 0.4)
      expect(c.scale(2)).to eq(described_class.new(0.4, 0.6, 0.8))
    end
  end

  describe '#*' do
    it 'multiplies two colors' do
      c1 = described_class.new(1.0, 0.2, 0.4)
      c2 = described_class.new(0.9, 1.0, 0.1)
      expect(c1 * c2).to eq(described_class.new(0.9, 0.2, 0.04000000000000001))
    end
  end
end
