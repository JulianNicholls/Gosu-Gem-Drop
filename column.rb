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

      self.caption = "Goody Goody Gem Drop"

      @drawer = Drawer.new(self)

      reset

      # TEMPorary

      7.times do |value|
        @grid.add_gem(Grid::Point.new(value , 6), value + 1)
        @grid.add_gem(Grid::Point.new(0, value), value + 1)
      end

      @grid.add_gem(36, 12)
      @grid.new_waiting_gem
    end

    def reset
      @grid = Grid.new(@drawer)
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
