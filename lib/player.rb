class Player
  BASE_VALUE = 10
  attr_reader :name,:baseDMG, :hp, :dmg, :dmg_this_turn
  attr_accessor :poisoned
  def initialize(name)
    @name = name.capitalize
    @hp = 100
    @baseDMG = BASE_VALUE
    @poisoned
    @dmg_this_turn
  end

  def takeHit
    @hp -= dmgrand
  end

  def repair
    @hp += randcalc
    @poisoned = false
  end

  def boost
    @baseDMG += randcalc
  end

  def roll_poison
    if @poisoned
      @hp -= poison_calc
    end
  end

  private

  def randcalc
    @dmg_this_turn = rand(BASE_VALUE)
  end

  def dmgrand
    @dmg_this_turn = @baseDMG + rand(20)
  end

  def poison_calc
  @dmg_this_turn = (@hp + (rand(6) + rand(6)))/8
  end
end
