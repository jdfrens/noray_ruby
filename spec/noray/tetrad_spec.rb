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

  describe 'scale' do
    it 'multiplies by a factor' do
      tetrad = described_class.new(3.0, -2.0, 5.0, 1.0)
      expect(tetrad.scale(2.0)).to eq(described_class.new(6.0, -4.0, 10.0, 2.0))
    end
  end

  describe 'scale_inverse' do
    it 'divides by a factor' do
      tetrad = described_class.new(3.0, -2.0, 5.0, 1.0)
      expect(tetrad.scale_inverse(2.0)).to eq(described_class.new(1.5, -1.0, 2.5, 0.5))
    end
  end

  describe 'magnitude' do
    it 'computes length of unit x vector' do
      vector = described_class.vector(1.0, 0.0, 0.0)
      expect(vector.magnitude).to eq(1.0)
    end

    it 'computes length of unit y vector' do
      vector = described_class.vector(0.0, 1.0, 0.0)
      expect(vector.magnitude).to eq(1.0)
    end

    it 'computes length of unit z vector' do
      vector = described_class.vector(0.0, 0.0, 1.0)
      expect(vector.magnitude).to eq(1.0)
    end

    it 'computes length of interesting vector' do
      vector = described_class.vector(1.0, -2.0, 3.0)
      expect(vector.magnitude).to eq(Math.sqrt(14.0))
    end
  end

  describe 'normalize' do
    it 'normalizes a simple vector' do
      vector = described_class.vector(4.0, 0.0, 0.0)
      expect(vector.normalize).to eq(described_class.vector(1.0, 0.0, 0.0))
    end

    it 'normalizes an interesting vector' do
      vector = described_class.vector(1.0, -2.0, 3.0)
      expected_vector =
        described_class.vector(1.0, -2.0, 3.0).scale_inverse(Math.sqrt(14))
      expect(vector.normalize).to eq(expected_vector)
    end
  end

  describe 'dot' do
    let(:vector1) { described_class.vector(1.0, 2.0, 3.0) }
    let(:vector2) { described_class.vector(2.0, 3.0, 4.0) }

    it 'computes the dot product of two vectors' do
      expect(vector1.dot(vector2)).to eq(20)
    end

    it 'computes the same dot product in either order' do
      expect(vector2.dot(vector1)).to eq(vector1.dot(vector2))
    end
  end

  describe 'cross' do
    let(:vector1) { described_class.vector(1.0, 2.0, 3.0) }
    let(:vector2) { described_class.vector(2.0, 3.0, 4.0) }

    it 'computes the cross product of two vectors' do
      expect(vector1.cross(vector2)).to eq(described_class.vector(-1.0, 2.0, -1.0))
    end

    it 'computes different cross product in different order' do
      expect(vector2.cross(vector1)).to eq(described_class.vector(1.0, -2.0, 1.0))
    end
  end
end
