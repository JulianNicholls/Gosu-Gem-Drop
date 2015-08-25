require 'gosu_enhanced'

module ColumnDrop
  class Game < Gosu::Window
    include GosuEnhanced

    def initialize
      super(300, 320)

      @image = Gosu::Image.load_tiles('media/column-drop2.png', 40, 40)
    end

    def update

    end

    def draw
      draw_background

      pos1 = Point.new(10, 25)

      @image.each do |image|
        image.draw(pos1.x, pos1.y, 2 )
        pos1.move_by!(0, 40)
      end
    end

    private

    def draw_background
      top_left = Point.new(0, 0)
      size     = Size.new(300, 320)
      draw_rectangle(top_left, size, 1, Gosu::Color::BLACK)
      draw_rectangle(top_left.offset(10, 25), size.deflate(20, 35), 1, Gosu::Color.argb(0xff303030))
    end
  end
end

ColumnDrop::Game.new.show
