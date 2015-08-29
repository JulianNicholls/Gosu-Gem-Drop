require 'constants'
require 'gosu_enhanced'
require 'gridpoint'
require 'dropgem'

module ColumnDrop
  # 7 x 7 grid for gem drop game
  class Grid
    # Create an empty grid, with an injected drawer

    def initialize(drawer)
      @grid = Array.new(7 * 7, 0)
      @drawer = drawer
    end

    def add_gem(place, value)
      place = to_index(place)

      @grid[place] = value
    end

    # A gem may not be removed, if it is a blank gem, in which case it will
    # be transformed into a numbered gem
    def remove_gem(place)
      place = to_index(place)

      value = @grid[place]
      @grid[place] = [0. value - 8].max
    end

    def draw
      @grid.each_with_index do |cell, index|
        @drawer.draw_gem(to_gpoint(index), cell)
      end

      return unless @waiting_gem

      @waiting_gem.draw
    end

    def process_click(point)
      return unless point.x.between?(BOARD_LEFT + 7 * TILE) &&
        point.y.between?(BOARD_TOP - TILE, BOARD_TOP + 7 * TILE)

      # Do something with click
    end

    def new_waiting_gem(value = nil)
      return if @waiting_gem

      setup = value || rand(1..7)
      setup += BLANK_FLAG if rand(1..8) == 1

      @waiting_gem = DropGem.new(setup, @drawer)
    end

    private

    # Convert a value to an index into the grid, if it is a grid point.
    def to_index(place)
      place.respond_to?(:x) ? place.y * 7 + place.x : place
    end

    def to_gpoint(index)
      Grid::Point.new(index % 7, index / 7)
    end
  end
end
