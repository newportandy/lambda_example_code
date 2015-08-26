ZERO = ->(f) { ->(v) {       v   } }
ONE  = ->(f) { ->(v) {    f.(v)  } }
TWO  = ->(f) { ->(v) { f.(f.(v)) } }

def to_integer(num)
  num.(->(x) { x + 1}).(0)
end

puts to_integer(TWO)

# next - subtraction.......... UGH....
