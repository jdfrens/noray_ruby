# frozen_string_literal: true

RSpec.describe Noray::Tetrad do # rubocop:disable Metrics/BlockLength
  describe '#initialize' do
    subject { described_class.new(1.0, 2.0, 3.0, 4.0) }

    it { is_expected.to have_attributes(x: 1.0, y: 2.0, z: 3.0, w: 4.0) }
  end

  describe '.point' do
    it 'initializes as a point' do
      point = described_class.point(1.0, 2.0, 3.0)
      expect(point).to eq(described_class.new(1.0, 2.0, 3.0, 1.0))
    end
  end

  describe '.vector' do
    subject(:vector) { described_class.vector(1.0, 2.0, 3.0) }

    it 'initializes as a vector' do
      expect(vector).to eq(described_class.new(1.0, 2.0, 3.0, 0.0))
    end

    it { is_expected.to be_a_vector }
    it { is_expected.to_not be_a_point }
  end

  describe '+' do
    it 'adds two tetrads' do
      tetrad1 = described_class.new(3.0, -2.0, 5.0, 1.0)
      tetrad2 = described_class.new(-2.0, 4.0, 1.0, 0.0)
      expect(tetrad1 + tetrad2).to eq(described_class.new(1.0, 2.0, 6.0, 1.0))
    end
  end

  describe '-' do
    it 'subtracts one tetrad from another' do
      tetrad1 = described_class.new(3.0, -2.0, 5.0, 1.0)
      tetrad2 = described_class.new(-2.0, 4.0, 1.0, 0.0)
      expect(tetrad1 - tetrad2).to eq(described_class.new(5.0, -6.0, 4.0, 1.0))
    end
  end

  describe '-@' do
    it 'negates a tetrad' do
      tetrad = described_class.new(3.0, -2.0, 5.0, 1.0)
      expect(-tetrad).to eq(described_class.new(-3.0, 2.0, -5.0, -1.0))
    end
  end
end
