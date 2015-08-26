ZERO = ->(f) { ->(v) {       v   } }
ONE  = ->(f) { ->(v) {    f.(v)  } }
TWO  = ->(f) { ->(v) { f.(f.(v)) } }

TRU = ->(x) { ->(y) { x } }
FLSE = ->(x) { ->(y) { y } }

IS_ZERO = ->(f) { f.(->(v) { FLSE }).(TRU)  }


def to_bool(bool)
  bool.(true).(false)
end

puts to_bool(TRU)
puts to_bool(FLSE)

puts to_bool(IS_ZERO.(ZERO))
puts to_bool(IS_ZERO.(TWO))

# next up - if/else
