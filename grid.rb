require 'constants'
require 'gosu_enhanced'

module ColumnDrop
  # 7 x 7 grid for gem drop game
  class Grid
    # Create an empty grid, with an injected drawer

    def initialize(drawer)
      @grid = Array(7 * 7, 0)
      @drawer = drawer
    end

    private

    def to_index(gpoint)
      gpoint.y * 7 + gpoint.x
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

      private

      def valid?
        x.between?(0, 6) && y.between?(0, 6)
      end
    end
  end
end
