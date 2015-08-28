require 'constants'
require 'gosu_enhanced'

module ColumnDrop
  # 7 x 7 grid for gem drop game
  class Grid
    # Create an empty grid, with an injected drawer

    def initialize(drawer)
      @grid = Array.new(7 * 7, 0)
      @drawer = drawer
      @waiting_gem = 0
    end

    def add_gem(place, value)
      place = to_index(place)

      @grid[place] = value
    end

    # A gem may not be removed, if it is a blank gem, in which case it will
    # be transformed into a numbered gem
    def remove_gem(place)
      place = to_index(place)

      value = @grid[place]
      @grid[place] = [0. value - 8].max
    end

    def draw
      @grid.each_with_index do |cell, index|
        @drawer.draw_gem(to_gpoint(index), cell)
      end

      return if @waiting_gem == 0

      @drawer.draw_gem(Grid::Point.new(0, -1), @waiting_gem)
    end

    def process_click(point)
      return unless point.x.between?(BOARD_LEFT + 7 * TILE) &&
        point.y.between?(BOARD_TOP - TILE, BOARD_TOP + 7 * TILE)

      # Do something with click
    end

    def new_waiting_gem(value = nil)
      return if @waiting_gem != 0

      @waiting_gem = value || rand(1..7)
      @waiting_gem += BLANK_FLAG if rand(1..8) == 1
    end

    private

    # Convert a value to an index into the grid, if it is a grid point.
    def to_index(place)
      place.respond_to?(:x) ? place.y * 7 + place.x : place
    end

    def to_gpoint(index)
      Grid::Point.new(index % 7, index / 7)
    end

    # Co-ordinate relative to grid
    class Point < GosuEnhanced::Point
      include Constants

      def to_point
        GosuEnhanced::Point.new(BOARD_LEFT, BOARD_TOP)
          .offset(x * TILE, y * TILE)
      end

      # Can only be called if point is within the board, or in the well above
      def from_point(point)
        new(point.x - BOARD_LEFT, point.y - BOARD_TOP)
      end

      private

      def valid?
        x.between?(0, 6) && y.between?(-1, 6)   # -1 is above the columns
      end
    end
  end
end
