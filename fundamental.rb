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
person = {name: 'ED', age: 23, friends: ['Mustang', 'Alphonce'], phones: [home: '070-1234-5678', mobile: 0124-765-2316]}
person[:name] # => ED
person[:firends] # => ["Mustang", "Alphonce"]
person[:firends][0] # => "Mustang"

i = [
  {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  },
  {
    "id": 2,
    "name": "Ervin Howell",
    "username": "Antonette",
    "email": "Shanna@melissa.tv",
    "address": {
      "street": "Victor Plains",
      "suite": "Suite 879",
      "city": "Wisokyburgh",
      "zipcode": "90566-7771",
      "geo": {
        "lat": "-43.9509",
        "lng": "-34.4618"
      }
    },
    "phone": "010-692-6593 x09125",
    "website": "anastasia.net",
    "company": {
      "name": "Deckow-Crist",
      "catchPhrase": "Proactive didactic contingency",
      "bs": "synergize scalable supply-chains"
    }
  },
]

------------------------------------------------------------------------------------------------------------
def buy_burger(menu, drink: true, poteto: true)

  if menu

  end

  if drink

  end

  if poteto

  end
end

