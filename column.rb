#!/usr/bin/env ruby -I.

require 'gosu_enhanced'

require 'constants'
require 'resources'
require 'grid'
require 'drawer'

module ColumnDrop
  # Gem drop game
  class Game < Gosu::Window
    include GosuEnhanced
    include Constants

    def initialize
      super(WIDTH, HEIGHT)

      @drawer = Drawer.new(self)
    end

    def update
    end

    def draw
      @drawer.draw_all

      grid_pos = Grid::Point.new(0, 6)

      7.times do |index|
        @drawer.draw_gem(grid_pos, rand(2..6))
        grid_pos.move_by!(1, 0)
      end
    end

    private

    def draw_background
    end
  end
end

ColumnDrop::Game.new.show
