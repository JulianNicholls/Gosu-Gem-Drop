module ColumnDrop
  class Grid
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
