class Frame
  attr_accessor :score, :name, :pins
  def initialize (name)
    self.name = name
  end
  def finish?
    !score.nil?
  end
end