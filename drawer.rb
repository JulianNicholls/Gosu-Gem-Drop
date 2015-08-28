require 'gosu_enhanced'
require 'constants'
require 'resources'
require 'grid'

module ColumnDrop
  # Drawer for gem drop game
  class Drawer
    include GosuEnhanced
    include Constants

    def initialize(window)
      @window = window

      @gems = ResourceLoader.tiles
    end

    def draw_all
      draw_background
      draw_lines
    end

    # Draw a 1-based gem. It makes more sense to ask for gem 1 to draw a gem
    # with a '1' on it.
    # gpoint is a Grid::Point
    def draw_gem(gpoint, index, z_index = 2)
      return if index == 0

      point = gpoint.to_point
      @gems[index - 1].draw(point.x, point.y, z_index)
    end

    private

    def draw_background
      top_left = Point.new(0, 0)
      size     = Size.new(WIDTH, HEIGHT)

      @window.draw_rectangle(top_left, size, 1, MARGIN_COLOUR)
      @window.draw_rectangle(top_left.offset(BOARD_LEFT, BOARD_TOP),
                             Size.new(BOARD, BOARD), 1, BOARD_COLOUR)
    end

    def draw_lines
      draw_line_set(Grid::Point.new(1, 0), Size.new(1, BOARD), Size.new(1, 0))
      draw_line_set(Grid::Point.new(0, 1), Size.new(BOARD, 1), Size.new(0, 1))
    end

    def draw_line_set(origin, size, offset)
      6.times do
        @window.draw_rectangle(origin.to_point, size, 1, LINE_COLOUR)
        origin.move_by! offset
      end
    end
  end
end
