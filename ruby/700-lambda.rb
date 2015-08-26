ZERO = ->(f) { ->(v) {       v   } }
ONE  = ->(f) { ->(v) {    f.(v)  } }
TWO  = ->(f) { ->(v) { f.(f.(v)) } }

DECREMENT = ->(n) { ->(f) { ->(x) {
  n.(->(g) { ->(h) { h.(g.(f)) } }).(->(y) { x }).(->(y){ y })
} } }

MULT = ->(a) { ->(b) { ->(f) {  a.(b.(f)) } } }
EIGHT = MULT.(TWO).(MULT.(TWO).(TWO))

TRU = ->(x) { ->(y) { x } }
FLSE = ->(x) { ->(y) { y } }

IS_ZERO = ->(f) { f.(->(v) { FLSE }).(TRU)  }

IF = ->(bool) { ->(a) { ->(b) { bool.(a).(b)  } } }

Z = ->(z) {
  ->(f) {    ->(n){ f.(f).(n) }  }.(
  ->(f) { z.(->(n){ f.(f).(n) }  )})
}

fact = Z.(
  ->(recursion) {
    ->(x) {
      if x == 1
        1
      else
        x * recursion.(x-1)
      end
    }
  }
)

puts fact.(8)

def to_integer(num)
  num.(->(x) { x + 1}).(0)
end


# Just substitute all the stuff in right?

#puts to_integer(FACT.(EIGHT))
