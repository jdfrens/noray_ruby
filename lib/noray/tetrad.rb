# frozen_string_literal: true

module Noray
  # Represents a tetrad which can be a point or a vector.
  class Tetrad
    # @dynamic x, y, z, w
    attr_reader :x, :y, :z, :w

    def initialize(x, y, z, w) # rubocop:disable Naming/MethodParameterName:
      @x = x
      @y = y
      @z = z
      @w = w
    end
  end
end
