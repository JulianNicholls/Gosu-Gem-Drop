module ColumnDrop
  # Animation runner
  class Animation
    def initialize(speed, &block)
      @speed = speed
      @block = block
      @counter - 0
    end

    def tick
      if @counter += 1 == @speed
        @counter = 0
        return block.call
      end
    end
  end
end
