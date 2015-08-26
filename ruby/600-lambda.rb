ZERO = ->(f) { ->(v) {       v   } }
ONE  = ->(f) { ->(v) {    f.(v)  } }
TWO  = ->(f) { ->(v) { f.(f.(v)) } }

TRU = ->(x) { ->(y) { x } }
FLSE = ->(x) { ->(y) { y } }

IS_ZERO = ->(f) { f.(->(v) { FLSE }).(TRU)  }

IF = ->(bool) { ->(a) { ->(b) { bool.(a).(b)  } } }

puts IF.(IS_ZERO.(ZERO)).(->{ puts "TRUE!!!" }).( -> { puts "FALSE"} ).call


#  We've got everything we need - except recursion...
