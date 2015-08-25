#!/usr/bin/env ruby -I.

require 'gosu_enhanced'

require 'constants'
require 'resources'
require 'drawer'

module ColumnDrop
  class Game < Gosu::Window
    include GosuEnhanced
    include Constants

    def initialize
      super(WIDTH, HEIGHT)

      @image = Gosu::Image.load_tiles('media/column-drop2.png', 40, 40)
    end

    def update

    end

    def draw
      Drawer.new.draw(self)

      pos1 = Point.new(BOARD_LEFT, BOARD_TOP)

      @image.each do |image|
        image.draw(pos1.x, pos1.y, 2 )
        pos1.move_by!(TILE, 0)
      end
    end

    private

    def draw_background
    end
  end
end

ColumnDrop::Game.new.show
