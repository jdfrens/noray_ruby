# frozen_string_literal: true

module Noray
  # Represents an RGB color with three floats.
  class Color
    # @dynamic r, g, b
    attr_reader :r, :g, :b

    def initialize(red, green, blue)
      @r = red
      @g = green
      @b = blue
    end

    def ==(other)
      r == other.r && g == other.g && b == other.b
    end

    def +(other)
      Color.new(r + other.r, g + other.g, b + other.b)
    end

    def -(other)
      Color.new(r - other.r, g - other.g, b - other.b)
    end

    def scale(scalar)
      Color.new(r * scalar, g * scalar, b * scalar)
    end

    def *(other)
      Color.new(r * other.r, g * other.g, b * other.b)
    end
  end
end
