# the board class stores the game grid and updates it
class Board
  attr_reader :grid, :winner

  # Creates a new nested array 3x3
  def initialize
    @grid = Array.new(3) { Array.new(3, 0) }
    @winner = nil
  end

  # Checks if gris position is already filled or fills it if it isn't
  def update_square(row, column, value)
    (return false unless @grid[row][column].zero?)
    @grid[row][column] = value
    true
  end

  # Translates the board from numbers to symbols for printing
  def print_board
    @grid.each do |row|
      row_string = '|'
      row.each do |value|
        row_string +=
          case value
          when 1
            'X|'
          when -1
            'O|'
          else
            ' |'
          end
      end
      puts row_string
    end
  end

  def check_for_winner
    # Check rows
    @grid.each do |row|
      row_check = row.reduce(0) { |sum, val| sum + val }
      case row_check
      when 3
        @winner = 'X'
      when -3
        @winner = 'O'
      end
    end

    # Check columns
    3.times do |i|
      column_check = @grid.reduce(0) { |sum, row| sum + row[i] }
      case column_check
      when 3
        @winner = 'X'
      when -3
        @winner = 'O'
      end
    end

    # Check diagonals
    diagonal_one = @grid[0][0] + @grid[1][1] + @grid[2][2]
    diagonal_two = @grid[0][2] + @grid[1][1] + @grid[2][0]
    if diagonal_one == 3 || diagonal_two == 3
      @winner = 'X'
    elsif diagonal_one == -3 || diagonal_two == -3
      @winner = 'O'
    end

    # Check if a winner has been found
    return false if @winner.nil?

    true
  end

  # Checks if the grid is full
  def grid_full?
    @grid.all? do |row|
      row.all? { |val| [1, -1].include?(val) }
    end
  end
end
