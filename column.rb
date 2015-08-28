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

      @drawer = Drawer.new(self)

      reset
    end

    def reset
      @grid = Grid.new(@drawer)
    end

    def update

    end

    def draw
      @drawer.draw_all
      @grid.draw

      run_animations
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
