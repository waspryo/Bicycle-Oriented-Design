n = 11
if n > 10
p '10より大きい'
else
p '10以下'
end
------------------------------------------------------------------------------------------------------------
def greeting(country)
  if country == 'japan'
    'こんにちは'
  else
    'hello'
  end
end
------------------------------------------------------------------------------------------------------------
def greeting(country = 'japan')
  if country == 'japan'
    p 'こんにちは'
  else
  p 'hello'
  end

end
------------------------------------------------------------------------------------------------------------
def default_args(a,b,c = 0, d = 0)
  p "a = #{a}, b = #{b}, c = #{c}, d = #{d}"
end
------------------------------------------------------------------------------------------------------------
def foo(time = Time.now, message = bar)
  p "time: #{time}, message: #{message}"
end

def bar
  'BAR'
end
------------------------------------------------------------------------------------------------------------
class Bicycle
  attr_reader :style, :size, :tapecolor, :front_shock, :rear_shock

  def initialize(args)
    @style        = args[:style]
    @size         = args[:size]
    @tapecolor    = args[:tapecolor]
    @front_shock  = args[:front_shock]
    @rear_shock   = args[:rear_shock]
  end

  def spares
    if style == :road
      { chain:     '10-speed',
        tire_size: '23', # milimeters
        tape_color: tape_color
      }
      else
      {
        chain:     '10-speed',
        tire_size: '2.1', # milimeters
        tape_color: rear_shock
      }
    end
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock  = args[:front_shock]
    @rear_shock   = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end
------------------------------------------------------------------------------------------------------------
class Bicycle
  # このクラスはもはやからとなった
  # このコードは RoadBike に継承された
end

class RoadBike < Bicycle
  #いまは Bicycleのサブクラス
  #かつての Bicycleクラスからのコード全て含む
end

class MountainBike < Bicycle
  #Bicycleのサブクラスのまま(Bicycleは現在からになっている)
  #コードは何も変更されていない
end

------------------------------------------------------------------------------------------------------------
class Bicycle
  attr_reader :size  # <- RoadBikeから昇格した
  def initialize(args={})
    @size = args[:size] # <- RoadBikeから昇格した
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args) # <- RoadBikeは’super’を必ず呼ばなければならなくなった
  end
end
------------------------------------------------------------------------------------------------------------
class RoadBike < Bicycle
  def spares
    {
      chain: '10-speed',
      tire_size: '23',
      tape_color: tape_color
    }

  end
end

class MountainBike < Bicycle
    def spares
      super.merge({rear_shock: rear_shock})
    end
end
------------------------------------------------------------------------------------------------------------

class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size       args[:size]
    @chain      args[:chain]
    @tire_size  args[:tire_size]
  end # 共通の内容はスーパークラスに初期値としてもたせる
end
------------------------------------------------------------------------------------------------------------