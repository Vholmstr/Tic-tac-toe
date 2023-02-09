#puts "|x|o|x|"
#puts "|x|o|o|"
#puts "|o|x|o|"

# x = 1     o = -1

class GameBoard
  attr_reader :grid

  def initialize()
    @grid = Array.new(3) {Array.new(3, 0)}
    @winner = nil
  end

  def update_square(row, column, value)
    if (@grid[row][column] == 0)
      @grid[row][column] = value
      return true
    else
      return false
    end
  end

  def print_board
    @grid.each do |row|
      row_string = "|"
      row.each do |value| 
        if value == 1
          row_string = row_string + "x|"
        elsif value == -1
          row_string = row_string + "o|"
        else
          row_string = row_string + " |"
        end
      end
      puts row_string
    end
  end
end

game = GameBoard.new


