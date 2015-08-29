require 'gridpoint'
require 'drawer'

module ColumnDrop
  class DropGem
    attr_accessor :column

    def initialize(value, drawer)
      @value = value
      @row   = -1
      @column = 3
      @drawer = drawer
    end

    def draw
      @drawer.draw_gem(Grid::Point.new(@column, @row), @value)
    end
  end
end
