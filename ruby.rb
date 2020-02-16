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

------------------------------------------------------------------------------------------------------------
class ObscuringReferences
attr_writer :data

  def initialize(data)
    @data = data
  end

  def diameters
    # 0はリム、１はタイヤ
    data.collect {| cell |}
      cell[0] + (cell[1] * 2)
  end
end

# リムとタイヤサイズ(ここではミリメートル)の２次元配列
@data = [[633, 20], [622, 43], [622, 34], [623,43]]
------------------------------------------------------------------------------------------------------------
class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect { |wheel|
      wheel.rim + (wheel.tire * 2) }
  end
  #  これだけでもwheelにrim/tireを送れる

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect { |cell|
    Wheel.new(cell[0], cell[1]) }
  end
end
------------------------------------------------------------------------------------------------------------
# メソッドの単一の責任にする
def diameters
  wheels.collect { |wheel| diameter(wheel) }
end

# 次に ^ 「1」の車輪の直径を計算する
def diameter(wheel)
  wheel.rim + (wheel.tire * 2)
end

array = [1,2,3,4,5,6,7,8]

p array.collect { |sum| sum += 3 }

array = [1,2,3,4,5,6,7,8]
p array.inject(0){ |res, x| res += x; res }

pet = Struct.new(:name, :age)
# dogにポチと7のパラメーターを持たせる
dog = pet.new('ポチ', 7)
# .nameでdogにアクセスする
p dog.name
------------------------------------------------------------------------------------------------------------
# Structを生成
record = Struct.new(:english, :math, :history) do
  # resultメソッド
  # 各科目の成績を出力する

  def result
    printf "English: %s Math: %s History: %s\n",english,math,history
  end

  # meanメソッド
  # 3科目の平均を得る
  def mean
    (english + math + history) / 3.0
  end
end
------------------------------------------------------------------------------------------------------------
class Gear
  attr_reader :chairning, :cog, :wheel

  def initialize(chairning, cog, rim, tire)
    @chairning = chairning
    @cog       = cog
    @wheel     = Wheel.new(rim, tire)
  end

  def ratio
    chairning / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  Wheel = Struct.new(:rim, :tire) do
    def diameter
      rim + (tire * 2)
    end
  end

end

------------------------------------------------------------------------------------------------------------
class Gear
  attr_reader :chairning, :cog, :wheel

  def initialize(chairning, cog, wheel=nil)
    @chairning = chairning
    @cog       = cog
    @wheel     = wheel
  end

  def ratio
    chairning / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim  = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end
------------------------------------------------------------------------------------------------------------
class Gear
  attr_reader :chairning, :cog, :rim, :tire
  def initialize(chairning, cog, rim, tire)
    @chairning = chairning
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end

  def ratio
    chairning / cog.to_f
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

end
------------------------------------------------------------------------------------------------------------
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog       = cog
    @wheel     = wheel
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def ratio
    chairning / cog.to_f
  end
end
------------------------------------------------------------------------------------------------------------
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainringn = chainring
    @cog        = cog
    @wheel      = Wheel.new(rim,tire)
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

