class Board
  attr_reader :grid, :winner

  # Creates a new nested array 3x3
  def initialize()
    @grid = Array.new(3) {Array.new(3, 0)}
    @winner = nil
  end

  # Checks if gris position is already filled or fills it if it isn't
  def update_square(row, column, value)
    if (@grid[row][column] == 0)
      @grid[row][column] = value
      return true
    else
      return false
    end
  end

  # Translates the board from numbers to symbols for printing
  def print_board
    @grid.each do |row|
      row_string = "|"
      row.each do |value| 
        if value == 1
          row_string = row_string + "X|"
        elsif value == -1
          row_string = row_string + "O|"
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

    # Check if a winner has been found
    if @winner != nil
      return true
    else
      return false
    end
  end
end