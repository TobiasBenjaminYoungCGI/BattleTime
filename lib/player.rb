class Player
  BASE_VALUE = 10
  attr_reader :name,:baseDMG, :hp, :dmg
  def initialize(name)
    @name = name.capitalize
    @hp = 100
    @baseDMG = BASE_VALUE
  end

  def takeHit
    @hp -= dmgrand
  end

  def repair
    @hp += rand(BASE_VALUE)
  end

  def boost
    @baseDMG += rand(BASE_VALUE)
  end

  private

  def dmgrand
    @baseDMG + rand(20)
  end
end
