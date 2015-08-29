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

      self.caption = "Goody Goody Gem Drops"

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
    end

    def add_animation(speed, &block)
      @animation = Animation.new(speed, block)
    end

    private

    def run_animations
      return if @animation.nil?

      @animation = nil if @animate.tick == :done
    end
  end
end

ColumnDrop::Game.new.show
