require 'gosu_enhanced'

module ColumnDrop
  class Game < Gosu::Window
    include GosuEnhanced

    def initialize
      super(220, 220)

      @image = Gosu::Image.load_tiles('media/Column-Drop.png', 30, 30)
    end

    def update

    end

    def draw
      top_left = Point.new(0, 0)
      size     = Size.new(220, 220)
      draw_rectangle(top_left, size, 1, Gosu::Color::BLACK)
      draw_rectangle(top_left.offset(5, 5), size.deflate(10, 10), 1, Gosu::Color.argb(0xff202020))
    end
  end
end

ColumnDrop::Game.new.show
