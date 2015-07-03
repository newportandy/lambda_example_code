ZERO = ->(f) { ->(v) {       v   } }
ONE  = ->(f) { ->(v) {    f.(v)  } }
TWO  = ->(f) { ->(v) { f.(f.(v)) } }

TRU = ->(x) { ->(y) { x } }
FLSE = ->(x) { ->(y) { y } }

NOT = ->(x) { x.(FLSE).(TRU) }

INCREMENT = ->(n) { ->(f) { ->(v) { f.(n.(f).(v)) } } }
DECREMENT = ->(n) { ->(f) { ->(x) { n.(->(g) { ->(h){ h.(g.(f)) } })
                                  .(->(y) { x }).(->(y){ y }) } } }

ADD = ->(a) { ->(b) { a.(INCREMENT).(b) } }
SUBTRACT = ->(a) { ->(b) { a.(DECREMENT).(b) } }
MULT = ->(a) { ->(b) { ->(c) { a.(b.(c)) } } }


TO_INT = ->(num) { num.(->(x){ x + 1}).(0) }

puts "ADDING ONE and TWO"
puts TO_INT.(ADD.(ONE).(TWO))

puts "subtracting ONE from TWO"
puts TO_INT.(SUBTRACT.(ONE).(TWO))

puts "MULT TWO TWO"
FOUR = MULT.(TWO).(TWO)
puts TO_INT.(FOUR)

puts "MULT FOUR TWO"
EIGHT = MULT.(FOUR).(TWO)
puts TO_INT.(EIGHT)

puts "subtracting FOUR from EIGHT"
puts TO_INT.(SUBTRACT.(FOUR).(EIGHT))

n = ZERO
5.times do
  n = INCREMENT.(n)
  puts TO_INT.(n)
end

TO_BOOL = ->(bool) { bool.(true).(false) }

puts "TO_BOOL TRU"
puts TO_BOOL.(TRU)
puts "TO_BOOL FLSE"
puts TO_BOOL.(FLSE)

puts "TO_BOOL NOT FLSE"
puts TO_BOOL.(NOT.(FLSE))


IF = ->(x) { x }

puts "IF.(TRU).(true).(false)"
puts IF.(TRU).(true).(false)
puts "IF.(FLSE).(true).(false)"
puts IF.(FLSE).(true).(false)

#ZERO = ->(f) { ->(v) {       v   } }
#
IS_ZERO = ->(x){ x.(->(v){FLSE}).(TRU) }

puts "IS_ZERO when ZERO"
puts TO_BOOL.(IS_ZERO.((ZERO)))

puts "IS_ZERO when INCREMENT.(ZERO)"
puts TO_BOOL.(IS_ZERO.(INCREMENT.(ZERO)))

Z = ->(z) {
  ->(f) {    ->(n){ f.(f).(n) }  }.(
  ->(f) { z.(->(n){ f.(f).(n) }  )})
}

FACT = Z.( ->(recursion) {
  ->(x) {
    IF.(IS_ZERO.(x)).(
      ONE
    ).(
      ->(z){
        MULT.(x).(recursion.(DECREMENT.(x))).(z)
      }
    )
  }
})

puts "FACT.(FOUR)"
puts TO_INT.(FACT.(FOUR))
puts "winning"
