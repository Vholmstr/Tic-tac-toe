# the Player class is used to store the player symbol and value for the gameboard grid   
class Player
  attr_reader :value, :symbol

  def initialize(symbol, value)
    @symbol = symbol
    @value = value
  end
end