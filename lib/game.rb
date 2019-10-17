class Game
  attr_reader :current_turn, :winner

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
    @winner
  end

  def self.setup(player1, player2)
    @game = Game.new(player1, player2)
  end
  def self.start
    @game
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def attack(player)
    player.takeHit
  end

  def heal(player)
    player.repair
  end

  def powerup(player)
    player.boost
  end
  def switchTurn
    if @current_turn == player1
      @current_turn = player2
    else
      @current_turn = player1
    end
  end

  def complete?
    return player1.hp <= 0 ? @winner = player2  : player2.hp <= 0 ? @winner = player1 : false
  end
end
