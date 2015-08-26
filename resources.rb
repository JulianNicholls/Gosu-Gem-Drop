require 'gosu'

module ColumnDrop
  # Font / Image /  Sound Loader
  class ResourceLoader
    def self.tiles
      Gosu::Image.load_tiles('media/column-drop2.png', 40, 40)
    end
  end
end
