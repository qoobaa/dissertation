class Hex < ActiveRecord::Base
  # ...

  def self.find_by_positions(positions)
    find(:all,
         :conditions => ["(hexes.row = ? AND hexes.col = ?) OR " *
                         positions.size + " 0 = 1",
                         *positions.flatten])
  end

  def hex_positions
    [[row - 1, col + 1],
     [row - 1, col],
     [row, col - 1],
     [row + 1, col - 1],
     [row + 1, col],
     [row, col + 1]]
  end

  def hexes
    board_hexes.find_by_positions(hex_positions)
  end

  # ...
end
