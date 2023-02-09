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

  def check_for_winner
    # Check rows
    @grid.each do |row|
      row_check = row.reduce(0) {|sum, val| sum += val}
      if row_check == 3
        @winner = "X"
      elsif row_check == -3
        @winner = "O"
      else
      end
    end

    # Check columns
    for i in (0..2)
      column_check = @grid.reduce(0) {|sum, row| sum += row[i]}
      if column_check == 3
        @winner = "X"
      elsif column_check == -3
        @winner = "O"
      else
      end
    end
    
    # Check diagonals
    diagonal_one = @grid[0][0] + @grid[1][1] + @grid[2][2]
    diagonal_two = @grid[0][2] + @grid[1][1] + @grid[2][0]
    if diagonal_one == 3 || diagonal_two == 3
      @winner = "X"
    elsif diagonal_one == -3 || diagonal_two == -3
      @winner = "O"
    else
    end

    # Check for a winner
    if @winner != nil
      puts "Winner: " + @winner
      return true
    else
      return false
    end
  end
end

game = GameBoard.new
game.print_board
puts game.update_square(0,2,-1)
game.print_board
puts game.update_square(1,1,-1)
game.print_board
puts game.update_square(2,0,-1)
game.print_board
game.check_for_winner


