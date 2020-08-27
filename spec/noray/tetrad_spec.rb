# frozen_string_literal: true

RSpec.describe Noray::Tetrad do
  describe '#initialize' do
    it 'initializes the components' do
      tetrad = Noray::Tetrad.new(1.0, 2.0, 3.0, 4.0)
      expect(tetrad.x).to be(1.0)
      expect(tetrad.y).to be(2.0)
      expect(tetrad.z).to be(3.0)
      expect(tetrad.w).to be(4.0)
    end
  end
end
