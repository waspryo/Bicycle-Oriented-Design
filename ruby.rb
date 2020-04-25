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

------------------------------------------------------------------------------------------------------------
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end

end
------------------------------------------------------------------------------------------------------------
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chairning / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end
------------------------------------------------------------------------------------------------------------
fruits = {"banana" => 100, "berry" => 250, "orange" => 90 }

p fruits.fetch("banana")
p fruits.fetch("berry")
p fruits.fetch("orange")


begin
  fruits = {"banana" => 100, "berry" => 250, "orange" => 90 }
  p fruits.fetch("lemon")
rescue => e
  p "there is no key at all"
ensure
  p e
end
------------------------------------------------------------------------------------------------------------

module SomeFramework
  class Gear
      attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog       = cog
      @wheel     = wheel
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
end

module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring],
                            args[:cog],
                            wheel[:wheel])
  end
end
------------------------------------------------------------------------------------------------------------
class Gear
  attr_reader :chainring, :cog

  def initialize(chainring, cog)
    @chainring = chainring
    @cog       = cog
  end

  def gear_inches(diameter)
    ratio * diameter
  end

  def ratio
    chainring / cog.to_f
  end

end

class Wheel
  attr_reader :rim, :tire, :gear

  def initialize(rim, tire, chainring, cog)
    @rim = rim
    @tire = tire
    @gear = Gear.new(chainring, cog)
  end

  def diameter
    rim + (tire * 2)
  end

  def gear_inches
    gear.gear_inches(diameter)
  end
end


class ::Emerald::Notifications::Slack::AWordOfBot::Strategy::BroadcastBot
  ENDPOINT=ENV['SLACK_NOTIFICATION_BROADCAST_SERVICE_COMANY_ENDPOINT'].freeze

    def exec(payload: payload)
      if ::Emerald::Notifications::Slack::AWordOfBot::Strategy::BroadcastBot::ENDPOINT.blank?
        ::Rails.logger.warn("Not set SLACK_NOTIFICATION_BROADCAST_SERVICE_COMANY_ENDPOINT. Suspends slack notification processing.")
        return false
      end
      company = payload
      #
      uemoto_slack_id = '<@U7BS0AKFF>'
      minami_slack_id = '<@U6RBMRHT6>'
      url             = Rails.application.routes.url_helpers.admin_release_url(project.id)
      text            = "#{uemoto_slack_id} #{minami_slack_id} #{project.company.company_name}様から配信代行の審査申し込みがきています:)<#{url}>"
      res             = Faraday.post ENV['SLACK_NOTIFICATION_BROADCAST_SERVICE_COMANY_ENDPOINT'], JSON.generate({text: text}),
                              context_type: "application/json"
    end
end

class ::Emerald::Notifications::Slack::AWordOfBot::Context::BroadcastBot
  attr_reader :strategy

  def initialize strategy:
    @strategy = strategy
  end

  def exec()
    self.strategy.exec()
  end
end

class ::Emerald::Notifications::Slack::AWordOfBot::Factory::BroadcastBot
  def self.create
    ::Emerald::Notifications::Slack::AWordOfBot::Context::BroadcastBot.new(strategy: ::Emerald::Notifications::Slack::AWordOfBot::Strategy::BroadcastBot.new)
  end
end

------------------------------------------------------------------------------------------------------------
class Trip
  attr_reader :bicycles :customers, :vehicle

  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
  end
end

class Mechanic

  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)

  end
end
------------------------------------------------------------------------------------------------------------
class Trip
  attr_reader :bicycles, customers, :vehicle

  def prepare(prepapers)
    prepares.each { |prepare|
    case prepare
    when Mechanic
      prepare.prepare_bicycles(bicycles)
    when TripCoodinator
      prepare.buy_food(customers)
    when Driver
      prepare.gas_up(vechicle)
      prepare.fill_water_tank(vechicle)
    end
    }
  end
end

class TripCoodinator
  def buy_food(customers)
  end

end

class Trip
  attr_reader :bicycles, :customers, :vechicle

  def prepare(prepares)
    prepares.each { |prepare|
      prepare.prepare_trip(self)
    }
  end
end

# 全ての準備者(Prepare)は
# 'prepare_trip'に応答するダック

class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each { |bicycle|
     prepare_bicycle(bicycle)}
  end
end

class TripCoodinator

  def prepare_trip(trip)
    buy_food(trip.customers)
  end

end

class Driver
  def prepare_trip(trip)
    vechicle = trip.vechicle
    gas_up(vechicle)
    fill_water_tank(vechicle)
  end
end
------------------------------------------------------------------------------------------------------------
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(prepares)
    prepares.each { |prepare|
      case prepare
      when Mechanic
        prepare.prepare_bicycles(bicycles)
      when TripCoodinator
        prepare.buy_food(customers)
      when Driver
        prepaper.gas_up(vechicle)
        prepaper.fill_water_tank(vechicle)
      end
    }
  end
end
------------------------------------------------------------------------------------------------------------
if prepare.kind_of?(Mechanic)
  prepare.prepare_bicycles(bicycle)
elsif prepare.kind_of?(TripCoodinator)
  prepare.buy_food(customers)
elsif prepare.kind_of?(Driver)
  prepare.gas_up(vechicle)
  prepare.fill_water_tank(vechicle)
end
------------------------------------------------------------------------------------------------------------
class Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size       = args[:size]
    @tape_color = args[:tape_color]
  end

  def spares
    {
     chain:       '10-speed',
     tire_size:   '23',
     tape_color:  'tape_color'
    }
  end
end
------------------------------------------------------------------------------------------------------------
class Bicycle
  attr_reader :style, :size, :tape_color, :front_sock, :rear_shock

  def initialize(args)
    @style      = args[:style]
    @size       = args[:size]
    @tape_color = args[:tape_color]
    @front_sock = args[:front_sock]
    @rear_shock = args[:rear_shock]
  end

  def spares
    if style == :road
      {
        chain:      '10-speed',
        tire_size:  '23', # millimeters
        tape_color: 'tape_color',
      }
    else
      {
        chain:       '10-speed',
        tire_size:   '2.1', # inches
        rear_shock:  rear_shock,
      }
  end
end
------------------------------------------------------------------------------------------------------------
class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end

end
------------------------------------------------------------------------------------------------------------
numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum += n
end
sum

numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n

  sum += sum_value
end

numbers = [1,2,3,4]
sum = 0

numbers.each { |n| sum += n }
sum

numbers
------------------------------------------------------------------------------------------------------------
numbers = [1,2,3,4,5,6]
even_numbers = numbers.select { |n| n.even? }

------------------------------------------------------------------------------------------------------------
numbers = [1,2,3,4,5,6]
non_multiple_of_three = numbers.reject { |n| n % 3 == 0 }
------------------------------------------------------------------------------------------------------------
numbers = [1,2,3,4,5,6]
even_number = numbers.find { |n| n.even? }
------------------------------------------------------------------------------------------------------------
week = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
week.inject('Sun') { |res, v| res += v; res }
------------------------------------------------------------------------------------------------------------
def liquid?(tempreature)
  0 <= tempreature && tempreature < 100
end

liquid?(-1)
------------------------------------------------------------------------------------------------------------
def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end
------------------------------------------------------------------------------------------------------------
def greeting(*names)
  "#{names.join('と')}、こんにちは！"
end

greeting
------------------------------------------------------------------------------------------------------------
dimentions = [
  [10,20],
  [30,40],
  [50,60]
]

areas = []

dimentions.each do |dimention|
  length = dimention[0]
  width = dimention[1]
  areas << length * width
end

# または

dimentions.each do |length, width|
  areas << length * width
end

nums = [1,2,3,4,5]
sum = 0

num.each {|n; sum|
  sum = 10
  sum += n

p sum
}

numbers = [1,2,3,4]
sum = 0

numbers.each {
  |n| sum_value = n.even? ? n * 10 : n
  sum += sum_value
}

------------------------------------------------------------------------------------------------------------
numbers = [1,2,3,4,5]
sum = 0


sum_value = 100

numbers.each { |sum_value|
  sum += sum_value
}
sum
------------------------------------------------------------------------------------------------------------
def greeting(country)
  return 'countryを入力してください' if country.nil?

  if country == 'japan'
    'こんにちは'
  else
    'hello'
  end
end
------------------------------------------------------------------------------------------------------------
def calc_with_break
  numbers = [1,2,3,4,5,6,7]

  target = nil
  numbers.shuffle.each {|n|
    target = n
    break if n.even?
  }
  target * 10
end
calc_with_break
------------------------------------------------------------------------------------------------------------
def calc_with_break
  numbers = [1,2,3,4,5,6,7]

  target = nil
  numbers.shuffle.each {|n|
    target = n
    return if n.even?
  }
  target * 10
end
calc_with_break

[1,2,3].each { |n|
  puts n
  return
}
------------------------------------------------------------------------------------------------------------
numbers = [1,2,3,4,5]
numbers.each {|n|
  next if n.even?
  puts n
  cake        = gets.chomp()
  cake_price  = gets.chomp()

  ------------------------------------------------------------------------------------------------------------
  module Sample
    class User
      NAME = 'Alice'.freeze

      def self.hello(name = NAME)
        "Hell, I am #{name}"
      end
    end
  end


  module Greeter
    def hello
      'hello'
    end
  end

  puts 'Start'
  module Greeter
    def hello
      'hello'
    end
  end

  begin
    greeter = Greeter.new
  rescue => exception
    puts '例外が発生したがここまま実行する'
  end

  puts 'End'

  def method_1
    puts 'method_1 start'
    begin
      method_2
    rescue => exception
      puts '例外が発生しました'
    end
    puts 'method_1 End'
  end

  def method_2
    puts "method_2 start"
    method_3
    puts 'method_2 end'
  end

  def method_3
  puts 'method_3 start'
  1 / 0
  puts 'method_3 end'
  end

  method_1

  ------------------------------------------------------------------------------------------------------------