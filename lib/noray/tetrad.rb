# frozen_string_literal: true

module Noray
  # Represents a tetrad which can be a point or a vector.
  class Tetrad
    # @dynamic x, y, z, w
    attr_reader :x, :y, :z, :w

    def self.point(x, y, z) # rubocop:disable Naming/MethodParameterName:
      new(x, y, z, 1.0)
    end

    def self.vector(x, y, z) # rubocop:disable Naming/MethodParameterName:
      new(x, y, z, 0.0)
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

    def point?
      w == 1.0 # rubocop:disable Lint/FloatComparison
    end

    def vector?
      w == 0.0 # rubocop:disable Lint/FloatComparison
    end

    def +(other)
      Tetrad.new(x + other.x, y + other.y, z + other.z, w + other.w)
    end

    def -(other)
      Tetrad.new(x - other.x, y - other.y, z - other.z, w - other.w)
    end

    def -@
      Tetrad.new(-x, -y, -z, -w)
    end

    def scale(factor)
      Tetrad.new(x * factor, y * factor, z * factor, w * factor)
    end

    def scale_inverse(factor)
      Tetrad.new(x / factor, y / factor, z / factor, w / factor)
    end
  end
end
