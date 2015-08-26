TWO  = ->(f) { ->(v) { f.(f.(v)) } }

# WAT.....
DECREMENT = ->(n) { ->(f) { ->(x) {
  n.(->(g) { ->(h) { h.(g.(f)) } }).(->(y) { x }).(->(y){ y })
} } }


def to_integer(num)
  num.(->(x) { x + 1}).(0)
end

puts to_integer(DECREMENT.(TWO))

# next - multiply
