#puts "|x|o|x|"
#puts "|x|o|o|"
#puts "|o|x|o|"

class GameBoard
  attr_reader :grid

  def initialize()
    @grid = Array.new(3) {Array.new(3, " ")}
  end

  def update_square(row, column, value)
    if (@grid[row][column] == " ")
      @grid[row][column] = value
      return true
    else
      return false
    end
  end

  def print_board
    @grid.each do |row|
      r = row.join("|")
      puts "|#{r}|"
    end
  end
end

game = GameBoard.new

