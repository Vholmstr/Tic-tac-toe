require_relative 'lib/board.rb'
require_relative 'lib/game.rb'

game = Game.new

ongoing = true

while ongoing
  game.new_game()
  until game.check_for_winner == true
    game.player_turn
  end
  play_again = game.prompt("Type y for a new game").to_s.slice(0)
  if play_again == "y"
    next
  else
    ongoing = false
  end
end