class Context
  def initialize(strategy)
    @strategy = strategy
  end

  def gender()
    @strategy.gender()
  end
end