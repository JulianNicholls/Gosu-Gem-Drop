module ColumnDrop
  # Constants
  module Constants
    MARGIN          = 5
    HEADER          = 40

    BOARD           = 280
    TILE            = 40

    WIDTH           = BOARD + MARGIN * 2
    HEIGHT          = 4 * MARGIN + HEADER + TILE + BOARD

    BOARD_TOP       = 3 * MARGIN + HEADER + TILE
    BOARD_LEFT      = MARGIN

    BLANK_FLAG      = 8

    EMPTY           = 0

    MARGIN_COLOUR   = Gosu::Color.new(0xff_303030)
    BOARD_COLOUR    = Gosu::Color::BLACK
    LINE_COLOUR     = Gosu::Color.new(0xff_eeb211)
  end
end
