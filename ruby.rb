chairing = 52
cog      = 11
ratio    = chairing / cog.to_f
puts ratio

chairing = 30
cog      = 27
ratio    = chairing / cog.to_f
puts ratio


class Gear
  attr_reader :chairning, :cog

  def initialize(chairning, cog)
    @chairning = chairning
    @cog       = cog
  end

  def ratio
    chairning / cog.to_f
  end
end

puts Gear.new(53, 11).ratio