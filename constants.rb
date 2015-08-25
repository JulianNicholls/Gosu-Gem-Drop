module ColumnDrop
  # Constants
  module Constants
    MARGIN    = 5
    HEADER    = 20

    BOARD     = 280
    TILE      = 40

    WIDTH     = BOARD + MARGIN * 2
    HEIGHT    = 4 * MARGIN + HEADER + TILE + BOARD

    BOARD_TOP       = 3 * MARGIN + HEADER + TILE
    BOARD_LEFT      = MARGIN

    MARGIN_COLOUR   = Gosu::Color.new(0xff_303030)
    BOARD_COLOUR    = Gosu::Color::BLACK
    LINE_COLOUR     = Gosu::Color.new(0xff_eeb211)
  end
end
