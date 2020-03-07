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

