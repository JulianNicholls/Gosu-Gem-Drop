require 'gridpoint'
require 'drawer'

module ColumnDrop
  # The latest gem that needs inserting
  class DropGem
    attr_accessor :column

    def initialize(grid, value, drawer)
      @grid   = grid
      @value  = value
      @gpoint = Grid::Point.new(3, -1)
      @drawer = drawer
    end

    def draw
      @drawer.draw_gem(@gpoint, @value)
    end

    def drop_by_one_row
      new_pos = Grid.down_by_one_line

      return false if !new_pos

      @gpoint = new_pos
    end
  end
end
