module ColumnDrop
  class Grid
    # Co-ordinate relative to grid
    class Point < GosuEnhanced::Point
      include Constants

      # Return a grid point or false
      def self.from_point(point)
        gpoint = new((point.x - BOARD_LEFT) / TILE, (point.y - BOARD_TOP) / TILE)

        gpoint.valid? ? gpoint : false
      end

      def to_point
        GosuEnhanced::Point(BOARD_LEFT, BOARD_TOP).offset(x * TILE, y * TILE)
      end

      # Ensure that the co-ordinates are within the board, or in the
      # line above
      def valid?
        x.between?(0, 6) && y.between?(-1, 6)
      end
    end
  end
end
