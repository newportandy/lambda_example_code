Z = ->(z) {
  ->(f) {    ->(n){ f.(f).(n) }  }.(
  ->(f) { z.(->(n){ f.(f).(n) }  )})
}

fact = Z.( ->(recursion) { ->(x) { x == 1 ? 1 : x * recursion.(x-1) } })
puts fact.(5)

times2 = ->(x) { x * 2 }
puts times2.(4)

wrapped_times2 = ->(n) { times2.(n) }
puts wrapped_times2.(4)

fib = Z.( ->(recursion) { ->(x) { x < 2 ? x : recursion.(x-1) + recursion.(x-2) } } )
puts fib.(20)
