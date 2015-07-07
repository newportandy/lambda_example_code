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
