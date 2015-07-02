ZERO = ->(f) { ->(v) {       v   } }
ONE  = ->(f) { ->(v) {    f.(v)  } }
TWO  = ->(f) { ->(v) { f.(f.(v)) } }

TRUE = ->(x) { ->(y) { x } }
FALSE = ->(x) { ->(y) { y } }

NOT = ->(x) { x.(FALSE).(TRUE) }

INCREMENT = ->(n) { ->(m) { ->(x) { m.(n.(m).(x)) } } }

ADD = ->(a) { ->(b) { a.(INCREMENT).(b) }  }


#INCREMENT = -> n { -> p { -> x { p.[n[p][x]] } } }
#succ = ->(cn) { ->(f){ ->(x) { f.(cn.(f).(x)) } } }
#ONE  = ->(f) { ->(v) {    f.(v)  } }


TO_INT = ->(num) { num.(->(x){ x + 1}).(0) }

puts "INCREMENTING"
puts TO_INT.(ADD.(ONE).(TWO))

x = ZERO
5.times do
  x = INCREMENT.(x)
  puts TO_INT.(x)
end

TO_BOOL = ->(bool) { bool.(true).(false) }

puts TO_BOOL.(TRUE)
puts TO_BOOL.(FALSE)

puts TO_BOOL.(NOT.(FALSE))

#ZERO = ->(f) { ->(v) {       v   } }
#
IS_ZERO = ->(x){ x.(->(v){FALSE}).(TRUE) }

puts "IS_ZERO when ZERO"
puts TO_BOOL.(IS_ZERO.((ZERO)))

puts "IS_ZERO when INCREMENT.(ZERO)"
puts TO_BOOL.(IS_ZERO.(INCREMENT.(ZERO)))
