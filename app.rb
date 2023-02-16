require_relative 'lib/board'
require_relative 'lib/game'

game = Game.new

ongoing = true

while ongoing
  game.new_game
  until game.check_result
    game.player_turn
  end
  play_again = game.prompt('Type y for a new game').to_s.slice(0)
  (next if play_again == 'y')
  ongoing = false
end
