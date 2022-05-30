class Player
  attr_accessor :lives, :lost, :name

  def initialize(name)
    @name = name
    @lives = 3
    @lost = false
  end

  def lost?
    if @lives == 0
      self.lost = true
    end
  end

end