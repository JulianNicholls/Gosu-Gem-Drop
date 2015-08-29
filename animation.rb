module ColumnDrop
  # Animation runner
  class Animation
    def initialize(speed, &block)
      @speed = speed
      @block = block
      @counter - 0
    end

    def tick
      return unless @counter += 1 == @speed

      @counter = 0
      block.call
    end
  end
end
