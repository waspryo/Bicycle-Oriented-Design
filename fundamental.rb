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

------------------------------------------------------------------------------------------------------------
def buy_burger(menu, options = {})
  drink = options[:drink]
  poteto = options[:poteto]
end

buy_burger('cheese', drink: true, poteto: true)

------------------------------------------------------------------------------------------------------------
def buy_burger(menu, drink: true, poteto: true)

end

buy_burger('fish', drink: true, poteto: false, salad: true, chicken: false)
------------------------------------------------------------------------------------------------------------
def buy_burger(menu, drink: true, poteto: true, **others)
puts others
end

buy_burger('fish', drink: true, poteto: false, salad: true, chicken: false)
------------------------------------------------------------------------------------------------------------
buy_burger('fish', {'drink' => true, 'poteto' => false})

buy_burger('fish', 'drink' => true, 'poteto' => false)

------------------------------------------------------------------------------------------------------------
def buy_burger(options = {}, menu)
  puts options
end

buy_burger({'drink' => true, 'potato' => false}, 'fish')
buy_burger('drink' => true, 'potato' => false, 'fish')
------------------------------------------------------------------------------------------------------------

arr = ['Japan', 'America', 'Germany', 'Canada', 'India', 'China', 'France']
ary.last
arr.select{|a|a.include?("France")}
ary.grep()


arr = ['Japan', 'America', 'Germany', 'Canada', 'India']

for i in do
  if arr[i] == 'Japan'
    puts "Japn is exist!!"
  end
end



arr = ['Japan', 'America', 'Germany', 'Canada', 'India']

m = "America"
index = 0
if arr.index(m) then
  a = 1
else
  a = 0
end

if index < a then
  puts m + 'が見つかりました'
else
  puts m + "見つかりませんでした。"
end



for i in arr do
  if i == 'Canada'
     p m + " found"
  else
     p m + ' Not found'
  end
end

------------------------------------------------------------------------------------------------------------

ary = [ ["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"] ]
for i in ary do
  puts i
end


ary = [ [1,2,3,4,5,6,7,8,9,10] ]
ary = [ ["90", "90", "90","90"], ["70", "70", "70"], ["50", "50", "50"] ]
for(k = 0, k < ary.length, k++) {
  total = 0
  for(i = 0, i < ary[k].length, i ++  ) {
    total =  total + ary[k][i]
  }
  puts total
}




ary = [ ["90", "90", "90"], ["70", "70", "70"], ["50", "50", "50"] ]

for k in ary do
  total = 0
  for i in k do
      total = total += i.to_i
    end
    puts total
end








ary = [ ["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"] ]
ary.inject([]) { |x, v| x += v; x }

numbers = [1, 2, 3, 4, 5]
sum = 0
numbers.each { |n| sum += n }



二次元配列の問題 1

ary = [ ["90", "90", "90"], ["70", "70", "70"], ["50", "50", "50"] ]
# 文字列を数字に変換する
b = ary.map{|a|a.map{|a|a.to_i}}
# 要素の合計値
c = b.map(&:sum)
puts c



------------------------------------------------------------------------------------------------------------

arr = [[:japan, 'yen'], [:us, "doller"],[:Phils, 'Peso']]

'apple'.respond_to?('include?')
'apple'.respond_to?(:include?)

'apple'.include?('pp')

def find_currency(country)
  currencies = {japan: 'yen', us: 'USD', phils: 'peso'}
  currencies[country]
end

def show_cuurency(country)
  currency = find_currency(country)

  if currency
    currency.upcase
  end
end

def show_currency(country)
  if currency = find_currency(country)
    currency.upcase
  end
end

def show_currency(country)
  if currency = find_currency(country)
   currency&.upcase
  elsif  !currency
    'hey there is no data'
  end
end

------------------------------------------------------------------------------------------------------------
m = [ {uuid: 'nice', signed_image_url: 'http', graph_type: 'photo'}, {uuid: 'OMG', signed_image_url: 'http://www', graph_type: 'video'} ]

def user_exists?
  user = find_user

  if user
  true
  else
    false
  end
end

def name
  !!find_user
end
------------------------------------------------------------------------------------------------------------
old_syntax = <<TEXT
{
  :name => 'Alice',
  :age=> 20,
  :gender => :female
}
TEXT

convert_hash_syntac(old_syntax)
-------------------------------------------------------
text = <<TEXT
i love Ruby.
Python is a great laungage.
Java and JavaScript are diffrent.
TEXT

text.scan(/[A-Z][A-Za-z]+/)
-------------------------------------------------------
address = <<TEXT
私の郵便番号は1234567です。
僕の住所は6770056兵庫県西脇市板波町1234だよ！
TEXT

puts address.gsub(/(\d{3})(\d{4})/,'\1-\2')

-------------------------------------------------------

'123-4567' =~ /\d{3}-\d{4}/

マッチしない場合はnilが帰る
'hello' =~ /\d{3}-\d{4}/
-------------------------------------------------------
if '123-4567'  =~ /\d{3}-\d{4}/
  puts 'マッチしました'
else
  puts 'マッチしませんでした'
end
-------------------------------------------------------
# 左辺に正規表現を置いても結果は同じ
/\d{3}-\d{4}/ =~ '123-4567' # => 0
/\d{3}-\d{4}/ =~ 'hello'
-------------------------------------------------------
!~を使うとマッチしなかったときにtrueを、マッチした時はfalseを返す
# マッチしなければtrue
'hello' !~ /\d{3}-\d{4}/ #=> true
'123-4567' !~ /\d{3}-\d{4}/ #=> false
-------------------------------------------------------
キャプチャー機能は()を使う
birthday = '私の誕生日は1991年07月18日です。'

m = /(\d+)年(\d+)月(\d+)日/.match(birthday)
m[1]
m[2]
m[3]
m[1]

m[1]
=> "1991"
m[2]
=> "07"
m[3]
=> "18"
-------------------------------------------------------
# 真偽値の判定とローカル変数への代入を同時にやってしまう
text = '私の誕生日は1991年07月18日です。'

m ＝ /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)

------------------------------------------------------------------------------------------------------------
class Bicycle
  attr_reader :size, :chaiin, :tire_size

  def initialize(arg={})
    @size       = arg[:size]
    @chain      = arg[:chain]   # default_chain
    @tire_size  = arg[:tire_size] # default_tire_size
  end

  def default_chain # 共通の初期値
    '10-speed'
  end

end
class RoadBike < Bicycle

  def default_tire_size
    '(23'
  end

end

class MountainBike < Bicycle

  def default_tire_size
    '2.1'
  end

end

class RecumbentBike < Bicycle
  def default_chain
    '9-speed'
  end
end
-------------------------------------------------------
class RecumbentBike < Bicycle
  def default_chain
    '9-speed'
  end
end

-------------------------------------------------------
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size         = args[:size]
    @chain        = args[:chain]
    @tire_size    = args[:tire_size]
  end
end


------------------------------------------------------------------------------------------------------------

'123 456 789'.scan(/\d+/)

'1991年07月18日 2020年03月20日'.scan(/(\d+)年(\d+)月(\d+)日/)

'1991年08月19日 2020年03月21日'.scan(/(?:\d+)年(?:\d+)月(?:\d+)日/)


'1991年08月19日 2020年03月21日'.scan(/\d+年\d+月\d+日/)

text = '郵便番号は123-4567です'

text[/\d{3}-\d{4}/]

text = '1234-5678 9876-5432'
text[/\d{4}-\d{4}/]

text = '私の誕生は1997年08月19日です'
text[/(\d+)年(\d+)月(\d+)日/]

text = '私の誕生は1997年08月19日です'
text[/(\d+)年(\d+)月(\d+)日/, 2]

text = '誕生日は1977年07月18日です'
text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, :day]

text = '誕生日は1977年07月18日です'
text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, 'day']

text = '郵便番号は123-4567です'
text.slice(/\d{3}-\d{4}/)


text = '誕生日は1977年07月18日です'
text.slice(/(\d+)年(\d+)月(\d+)日/, 3)

text = '郵便番号は123-4567です'
text.slice!(/\d{3}-\d{4}/)
text

text = '123,456-789'
text.split
# text.split(',')

text = '123,456-789'
text.split(/,|-/)


text = '123,456-789'
text.gsub(',', ':')

text = '誕生日は1977年07月18日です'

text.gsub(
  /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/,
  '\k<year>-\k<month>-\k<day>'
)

text = '123,456-789'

hash = {',' => ':','-' => '/'}
text.gsub(/,|-/, hash)

text = '123,456-789'
text.gsub(/,|-/) { |v| v == ',' ? ':': '/'}


text = '123,456-789'
text.gsub!(/,|-/, ':')
text

old_syntax = <<TEXT
{
  :name => 'Alice',
  :age => 20,
  :gender => :female
}
TEXT

convert_hash_syntaxt(old_syntax)

def convert_hash_syntax(old_syntax)
  old_syntax.gsub(/:(\w+) *=> */,'\1:')
end

Regexp.new('\d{3}-\d{4}')

/http:\/\/example\.com/

%r!http://example\.com!

%r{http://example\.com}

pattern = '\d{3}-\d{4}'

'123-4567' =~ /#{pattern}/

text = '03-1234-5678'

case text

when /^\d{3}-\d{4}$/
  puts '郵便番号です'
when /^\d{4}\/d{1,2}\/\d{1,2}$/
  puts '日付です'
when /^\d+^\d+-\d+$/
  puts '電話番号です'
end

'HELLO' =~ /hello/i

'HELLO' =~ %r{hello}i

regexp = Regexp.new('hello', Regexp::IGNORECASE)
'HELLO' =~ regexp

"Hello\nBye" =~ /Hello.Bey/
"Hello\nBye" =~ /Hello.Bye/m

regexp = Regexp.new('Hello.Bye', Regexp::MULTILINE)
"Hello\nBye" =~ regexp

regexp = /
  \d{3} # 郵便番号先頭3桁
  -
  \d{4}
  /x
  '123-4567' =~ regexp

  regexp = /
    \d{3}
    \  #半角スペースで区切る
    \d{4}
  /x
  '123 4567' =~ regexp

  pattern = << TEXT
    \d{3} # 郵便番号の先頭3桁
    - #区切り文字のハイフン
    \d{4}
  TEXT

  regexp = Regexp.new(pattern, Regexp::EXTENDED)
  '123-4567'

  "HELLO\nBYE" =~ /Hello.Bye/im

  regexp = Regexp.new('Hello.Bye', Regexp::IGNORECASE | Regexp::MULTILINE)
  "HELLO\nBYE" =~ regexp

  text = '私の誕生日は1991年07月18日です。'

  text =~ /(\d+)年(\d+)月(\d+)日/

  $~

  text = '誕生日は1977年07月18日です'
  text =~ /(\d+)年(\d+)月(\d+)日/

  Regexp.last_match

  Regexp.last_match(0)

  /\d{3}-\d{4}/.match?('123-4567')

  '123-4567'.match?(/\d{3}-\d{4]/)
------------------------------------------------------------------------------------------------------------
# 改札機のオブジェクトの作成
umeda   = Gate.new(:umeda)
mikuni  = Gate.new(:mikuni)

# 150円の切符を購入して梅田で乗車し、三国で下車する(NG)
ticket = Ticket.new(150)
umeda.enter(ticket)
mikuni.exit(ticket) #=> false
-------------------------------------------------------
# 190円の切符を購入して梅田で乗車し、三国で下車する(OK)
ticket = Ticket.new(190)
umeda.enter(ticket)
mikuni.exit.(ticket) #=> true

users = []
users << {first_name: 'Alice', last_name: 'Ruby', age: 20}
users << {first_name: 'John', last_name: 'Corner', age: 17}


users.each { |user| puts "氏名 #{user[:first_name]} #{user[:last_name]}, 年齢 #{user[:age]}" }

users.inject([]) { |v, x| v += x puts "氏名: #{v[:first_name]} #{v[:last_name]}, 年齢: #{v[:age]}" }
-------------------------------------------------------
users = []
users << {first_name: 'Alice', last_name: 'Ruby', age: 20}
users << {first_name: 'John', last_name: 'Corner', age: 17}

def full_name(u)
  "#{u[:first_name]} #{u[:full_name]}"
end

users.each { |u| puts "#{full_name(u)}, 年齢: #{u[:age]}" }

users = []
users << {first_name: 'Alice', last_name: 'Ruby', age: 20}
users << {first_name: 'John', last_name: 'Corner', age: 17}

user[0][:first_name]
users[0][:first_nameadaew]
# 勝手キーを追加できたり変更したりできるから[脆くて壊れやすいプログラムになりがち]
users[0][:country] = 'japan'
-------------------------------------------------------
class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)

    @first_name = first_name
    @last_name  = last_name
    @age        = age

  end

  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

end

users = []
users << User.new('Alice', 'baker', 24)
users << User.new('David', 'gatter', 32)

users.each {|user| puts "氏名 #{full_name(user)}, 年齢#{user.age}"}
-------------------------------------------------------
alice = User.new('Alice', 'billy', 17)
bob = User.new('Bob', 'dulan', 23)

class User
  attr_accessor :first_name

end

user = User.new('alice', 'ruby', 20)
user.first_name

user.first_name = 'アリス'
user.first_name
-------------------------------------------------------
class User

def initialize
  puts "初期化"
  end
end

class User

  def initialize(name, age)
  puts "name: #{name}, age #{age}"
  end
end
-------------------------------------------------------
class Greeting

  def say_hi(hello)
    puts hello
  end
end
-------------------------------------------------------
class User

  def initialize(name)
  @name = name
  end

  def hello
    "Hello, I am #{@name}"
  end

end


class User


  def hello
    shuffled_name = @name.chars.shuffle.join
    "Hello, i am #{shuffled_name}."
  end
end

class User

  def initialize(name)
    # @name = name
  end

  def hello
    "Hello, i am #{@name}"
  end

end
-------------------------------------------------------
class User

  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end


class User
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(value)
    @name = value
  end
end


class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
-------------------------------------------------------
class User
  attr_reader :name

  def initialize(name)
    @name = name
  end

end

class User
  attr_writer :name

  def initialize(name)
    @name = name
  end

end
-------------------------------------------------------
class User
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end
-------------------------------------------------------
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, I am #{@name}"
  end
end
-------------------------------------------------------
class User
  def initialize(name)
    @name = name
  end

  def self.create_users(names)
    names.map {|name|
      User.new(name)
    }
  end
  def hello
    "Hello, i am #{@name}"
  end

end

names = ['bob', 'Jane', 'alice']

users = User.create_users(names)

users.each {|user|
  puts user.hello
}

-------------------------------------------------------
class Product
  DEFAULT_PRICE = 0

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Product
  DEFAULT_PRICE = 0
  def self.default_price
    DEFAULT_PRICE
  end

  def default_price
    DEFAULT_PRICE

  end
end
------------------------------------------------------------------------------------------------------------
class Gate

  def initialize(name)
    @name = name
  end

  def exter(ticket)
    ticket.stamp
  end

  def enter(ticket)
  end

end

class Ticket
  def initialize(fare)
    @fare = fare
  end
end


-------------------------------------------------------
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def hello
    # selfなしでnameメソッドを呼ぶ
    "Hello, i am #{name}"
  end

  def hi
    # self付きでnameメソッドを呼ぶ
    "hi, i am #{self.name}"
  end

  def my_name
    # 直接インスタンス変数の@nameにアクセスする
    "My name is #{@name}"
  end
end
-------------------------------------------------------
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename_to_bob
    name = 'Bob'
  end

  def rename_to_john
    self.name = 'John'
  end

  def rename_to_dave
    @name = 'Dave'
  end

end

class Foo
  puts "クラス構文の直下のself: #{self}"

  def self.bar
  puts "クラスメソッドないのself: #{self}"
  end

  def baz
  puts "インスタンスメソッド内のself: #{self}"
  end
end

class Foo
  def self.bar
    self.baz
  end

  def baz
  self.bar
  end
end
-------------------------------------------------------
class Foo
  3.times do
    puts 'Hello'
  end

  def self.bar
    puts 'hello'
  end

  self.bar
end
-------------------------------------------------------
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    formatted_price = Product.format_price(price)
    "name: #{name}, price: #{formatted_price}"

  end
end

class User

end
-------------------------------------------------------
class Product
  attr_writer :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def product_name
    @name
  end

  def product_price
    @price
  end
end

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    @name = name
    @price = price
    @running_time = running_time
  end
end

class DVD < Product
  def initialize(name, price)
    super
  end
end

class DVD < Product
  def initialize(name, price)
    super()
  end
end
-------------------------------------------------------

class Product
  attr_writer :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class DVD < Product

end

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  def to_s
    "name: #{super}, running_time: #{running_time}"
  end
end

-------------------------------------------------------
class Foo
  def self.hello
  'hello'
  end
end

class Bar < Foo

end

-------------------------------------------------------
@delivery_content_collection {
  enable_content: [ "instagram_music” ],
  enable_content: [ "xxxx_music” ],
  values: [
      { code: “instagram_music” ,
        values [artist: “xxx” , music_name: “yyy"]
      },
      { code: "xxx_music" ,
        values [x: “xxx”, y: “yyy”, z: “zzz"]
      }
    ]
  }
  -------------------------------------------------------
  class User
    # デフォルトはpublic
    def hello
      'Hello!'
    end
  end
  -------------------------------------------------------
  class User
    # ここから下で定義されたメソッドはprivate

    private
    def hello
      'Hello!'
    end
  end

  -------------------------------------------------------
class User
  def hello
    "Hello, I am #{self.name}"
  end

  private
  def name
    'Alice'
  end
end
-------------------------------------------------------
class User

  def hello
    "HEllo, i am #{name}"
  end

  private

  def name
    'Alice'
  end

end

user = User.new
-------------------------------------------------------
class Product
  private

  def name
    'A great movie'
  end
end

class DVD < Product
  def to_s
    "name: #{name}"
  end
end

-------------------------------------------------------
class Product
  def to_s
    "name: #{name}"
  end

  private

  def name
    'A great movie'
  end
end

class DVD < Product
  private
  def name
    'An awsome film'
  end
end
-------------------------------------------------------

class User
  private
  def self.hello
    'Hello!'
  end
end


class User

  class << self
    private

    def hello
    'hello!'
    end
  end

end

class User
  def self.hello
    'Hello'
  end

  private_class_method :hello
end

class User
  def foo
    'foo'
  end

  def bar
    'bar'
  end

  private :foo, :bar

  def baz
    'baz'
  end
end
-------------------------------------------------------
class User
  attr_reader :name

  def initialize(name, weight)
    @name   = name
    @weight = weight
  end

  def heavier_than?(other_user)
    other_user.weight < @weight
  end
end


class User
  attr_reader :name

  def initialize(name, weight)
    @name   = name
    @weight = weight
  end

  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  protected

  def weight
    @weight
  end
end
-------------------------------------------------------
class Parent
  def initialize
  @first = 1
  @second = 2
  @third = 3
  end

  def number
    "#{@first}.#{@second}.#{@third}"
  end
end

class Child < Parent
  def initialize
    super
    @hour = 6
    @minute = 30
    @second = 59
  end

  def time
    "#{@hour}.#{@minute}.#{@second}"
  end
end
-------------------------------------------------------
class Product
  DEFAULT_PRICE = 0

  private_constant :DEFAULT_PRICE
end

class Product
  DEFAULT_PRICE = 0

  freeze
  DEFAULT_PRICE = 1000
end

class Product
  NAME = 'A product'
  SOME_NAMES = ['FOO', 'Bar', 'Baz']
  SOME_PRICES = {'Foo' => 100, 'Bar' => 2000, 'Baz' => 3000}
end

class Product
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].freeze

  def self.names_without_foo(names = SOME_NAMES)
    names.delete('Foo')
    names
  end
end

class Product
  SOME_NAMES = ['Foo'.freeze, 'Bar'.freeze, 'Baz'.freeze].freeze
end

SOME_NAMES = ['Foo', 'Bar', 'Baz'].map(&:freeze).freeze

class Product
  SOME_VALUE = 0
  SOME_TYPE = :foo
  SOME_FLAG = true
end
-------------------------------------------------------
class Product
  #クラスインスタンス変数
  @name = 'Product'

  def self.name
    # クラスインスタンス変数
    @name
  end

  def initialize(name)
    # インスタンス変数
    @name = name
  end

  def name
    # インスタンス変数
    @name
  end
end

class DVD < Product
  @name = 'DVD'

  def self.name
    @name
  end

  def upcase_name
    @name.upcase
  end
end


-------------------------------------------------------
class Product
  @@name = 'Product'

  def self.name
    @@name
  end

  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end
end

class DVD < Product
  @@name = 'DVD'

  def self.name
    @@name
  end

  def upcase_name
    @@name.upcase
  end
end
-------------------------------------------------------
$program_name = 'Awsome program'

class Program
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end
-------------------------------------------------------

class User
  def hello
    'Hello'
  end

  alias greeting hello
end
-------------------------------------------------------
class User
  undef freeze
end

class User
  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end
-------------------------------------------------------
class User
  private class BloodType
  end
end
-------------------------------------------------------
class User
  def name=(value)
    @name = value
  end
end

class Product
  attr_reader :code, :name

  def initialize(code, name)
    @code = code
    @name = name
  end
end

class Product

  def ==(other)
    if other.is_a?(Product)

      code == other.code

    else
      false
    end
  end
end
-------------------------------------------------------
a = 'abc'
b = 'abc'
a.equal?
-------------------------------------------------------
h = { 1 => 'Integer', 1.0 => 'Float' }
-------------------------------------------------------
a = 'japan'
b = 'japan'
-------------------------------------------------------
text = '03-1234-5678'

case text
  when /^\d{3}-\d{4}$/
    puts 'it is post code'
  when /^\d{4}\/\d{1,2}\/\d{1,2}$/
    puts 'it is date'
  when /^\d+-\d+-\d+$/
    puts 'it is phone number'
end
-------------------------------------------------------
value = [1,2,3]

case value
when String
  puts '文字列です'
when Array
  puts '配列です'
when  Hash
  puts 'ハッシュです'
end

name = 'John'

case name
when  'Mike'
  puts 'he is Mike'
when 'Jane'
  puts 'She is Jane'
when 'John'
  puts "He is the one who i'm looking for"
end
-------------------------------------------------------
class MyString < String

end

class MyArray < Array

end

class String
  def shuffle
    chars.shuffle.join
  end
end

class String
  def shuffle
    chars.shuffle
  end
end
-------------------------------------------------------
'MySrting'.underscore
numbers = [1,2,3]
name = ['John','Mike','Alice']
-------------------------------------------------------
class User
  def initialize(name)
    @name = name
  end

  def hello
    "hello, #{@name}"
  end
end

class User
  def hello
    "#{@name}さん、こんにちは！"
  end
end

class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}!"
  end
end

class User
  alias hello_original hello

  def hello
    "#{hello_original}じゃなくて、#{@name}さん、こんにちは！"
  end
end
------------------------------------------------------------------------------------------------------------
