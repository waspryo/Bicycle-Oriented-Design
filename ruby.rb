chairing = 52
cog      = 11
ratio    = chairing / cog.to_f
puts ratio

chairing = 30
cog      = 27
ratio    = chairing / cog.to_f
puts ratio


class Gear
  attr_reader :chairning, :cog, :rim, :tire

  def initialize(chairning, cog, rim, tire)
    @chairning = chairning
    @cog       = cog
    @rim       = rim
    @tire       = tire
  end

  def ratio
    chairning / cog.to_f
  end

  def gear_inches
    #タイヤはリムの周りを囲むので、直径を計算するためには2倍にする
    ratio * (rim + (tire * 2))
  end
end
------------------------------------------------------------------------------------------------------------
class Gear

  def initialize(chairning, cog)
    @chairning = chairning
    @cog       = cog <--- #破滅への道
  end

  def ratio
    chairning / cog.to_f
  end

  def gear_inches
    #タイヤはリムの周りを囲むので、直径を計算するためには2倍にする
    ratio * (rim + (tire * 2))
  end
end
puts Gear.new(53, 11).ratio
puts Gear.new(32, 21).ratio
------------------------------------------------------------------------------------------------------------

class Gear
  attr_reader :chairning, :cog #<--------

  def initialize(chairning, cog)
    @chairning = chairning
    @cog       = cog
  end

  def ratio
    chairning / cog.to_f #<--------------
  end
end

------------------------------------------------------------------------------------------------------------
# シンプルな再実装
def cog
  @cog * unanticipated_adjustment_factor
end

# より複雑な実装
def cog
  @cog * (foo ? bar_adjusutment : baz_adjustment)
end