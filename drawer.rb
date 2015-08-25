require 'gosu_enhanced'
require 'constants'

module ColumnDrop
  class Drawer
    include GosuEnhanced
    include Constants

    def draw(window)
      @window = window

      draw_background
      draw_lines
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
      col = Point.new(TILE, 0)
      row = Point.new(0, TILE)

      col_size = Size.new(1, BOARD)
      row_size = Size.new(BOARD, 1)

      6.times do
        @window.draw_rectangle(col.offset(BOARD_LEFT, BOARD_TOP), col_size, 1, LINE_COLOUR)
        @window.draw_rectangle(row.offset(BOARD_LEFT, BOARD_TOP), row_size, 1, LINE_COLOUR)

        col.move_by!(TILE, 0)
        row.move_by!(0, TILE)
      end
    end
  end
end
