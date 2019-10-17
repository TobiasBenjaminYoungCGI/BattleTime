class Game
  attr_reader :current_turn, :winner, :log

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
    @winner
    @log = ['Commence the Bout!']
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
    add_to_log(player.dmg_this_turn, "a mighty fist")
  end

  def heal(player)
    player.repair
    heal_for_log(player.dmg_this_turn)
  end

  def powerup(player)
    player.boost
    boost_for_log(player.dmg_this_turn)
  end

  def set_poison(player)
    player.poisoned = true
  end

  def poison_effect(player)
    player.roll_poison
    player.poisoned ? add_to_log(player.dmg_this_turn, "Poison") : nil
  end

  def switchTurn
    @current_turn == player1 ? @current_turn = player2 : @current_turn = player1
  end

  def complete?
    return player1.hp <= 0 ? @winner = player2  : player2.hp <= 0 ? @winner = player1 : false
  end

  private

  def add_to_log(value, attacktype)
    @log << "#{@current_turn.name} got damaged for #{value} by #{attacktype}"
  end

  def heal_for_log(value)
    @log << "#{@current_turn.name} got healed for #{value}"
  end

  def boost_for_log(value)
    @log << "#{@current_turn.name} boosted their base attack by #{value}"
  end
end
