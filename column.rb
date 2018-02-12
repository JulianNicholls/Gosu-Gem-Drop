#!/usr/bin/env ruby -I.

require 'gosu_enhanced'

require 'constants'
require 'resources'
require 'grid'
require 'drawer'
require 'animation'

module ColumnDrop
  # Gem drop game
  class Game < Gosu::Window
    include GosuEnhanced
    include Constants

    def initialize
      super(WIDTH, HEIGHT)

      self.caption = 'Goody Goody Gem Drops'

      @drawer = Drawer.new(self)

      reset
    end

    def reset
      @grid = Grid.new(@drawer)

      @grid.new_waiting_gem
    end

    # Indicate that we need the mouse cursor
    def needs_cursor?
      true
    end

    def update
    end

    def draw
      @drawer.draw_all
      @grid.draw

      run_animations
    end

    def button_down(btn_id)
      close if btn_id == Gosu::KbEscape

      process_mouse if btn_id == Gosu::MsLeft && !busy?
    end

    def add_animation(speed, &block)
      @animation = Animation.new(speed, block)
    end

    private

    def process_mouse
      column = column_from_point(Point(mouse_x, mouse_y))

      if column
        @grid.start_drop(column)
        add_animation(20) do
          @grid.continue_drop
        end
      end
    end

    def column_from_point(point)
      gpoint = Grid::Point.from_point(point)

      gpoint ? gpoint.x : false
    end

    def run_animations
      return if @animation.nil?

      @animation = nil if @animate.tick == :done
    end

    def busy?
      @animation
    end
  end
end

ColumnDrop::Game.new.show
