ZERO = ->(f) { ->(v) {       v   } }
ONE  = ->(f) { ->(v) {    f.(v)  } }
TWO  = ->(f) { ->(v) { f.(f.(v)) } }

MULT = ->(a) { ->(b) { ->(f) {  a.(b.(f)) } } }

FOUR = MULT.(TWO).(TWO)
EIGHT = MULT.(FOUR).(TWO)

def to_integer(num)
  num.(->(x) { x + 1}).(0)
end

puts to_integer(FOUR)
puts to_integer(EIGHT)

# Next up - boolean logic
