class Player
  attr_reader :value, :symbol

  def initialize(symbol, value)
    @symbol = symbol
    @value = value
  end
end