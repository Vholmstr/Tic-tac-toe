require_relative 'board'
require_relative 'player'

# Main class for game logic
class Game
  def initialize
    @player_one = Player.new('X', 1)
    @player_two = Player.new('O', -1)
    @current_player = @player_one
  end

  # Resets the game
  def new_game
    @board = Board.new
    puts 'New game started'
    puts '|1|2|3|'
    puts '|4|5|6|'
    puts '|7|8|9|'
  end

  def player_turn
    input = prompt("#{@current_player.symbol}s turn to pick a square from 1-9").to_i
    unless input.between?(1, 9)
      puts 'Invalid input'
      return false
    end

    # Checks if the chosen square is already filled or not
    if try_to_update_board(input)
      if @current_player == @player_one
        @current_player = @player_two
      else
        @current_player = @player_one
      end
      @board.print_board
      true
    else
      puts 'Square already filled, try again'
      false
    end
  end

  # Checks three in a row and if board is full
  def check_result
    if @board.grid_full?
      puts 'Board full, game ends in a draw'
      return true
    end

    (return false unless @board.check_for_winner)
    puts "#{@board.winner} is the winner!"
    true
  end

  def prompt(message)
    puts message
    gets
  end

  private

  # Converts the input into commands to update corresponding square in the grid
  def try_to_update_board(input)
    case input
    when 1
      @board.update_square(0, 0, @current_player.value)
    when 2
      @board.update_square(0, 1, @current_player.value)
    when 3
      @board.update_square(0, 2, @current_player.value)
    when 4
      @board.update_square(1, 0, @current_player.value)
    when 5
      @board.update_square(1, 1, @current_player.value)
    when 6
      @board.update_square(1, 2, @current_player.value)
    when 7
      @board.update_square(2, 0, @current_player.value)
    when 8
      @board.update_square(2, 1, @current_player.value)
    when 9
      @board.update_square(2, 2, @current_player.value)
    else
      false
    end
  end
end
