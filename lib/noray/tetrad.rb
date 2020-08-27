# frozen_string_literal: true

module Noray
  # Represents a tetrad which can be a point or a vector.
  class Tetrad
    # @dynamic x, y, z, w
    attr_reader :x, :y, :z, :w

    def self.point(x, y, z) # rubocop:disable Naming/MethodParameterName:
      new(x, y, z, 1.0)
    end

    def initialize(x, y, z, w) # rubocop:disable Naming/MethodParameterName:
      @x = x
      @y = y
      @z = z
      @w = w
    end

    def ==(other)
      x == other.x && y == other.y && z == other.z && w == other.w
    end
  end
end
