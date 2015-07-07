Y = ->(z) {
  ->(f) { f.(f) }.(
    ->(f) {
      z.(->(n){f.(f).(n)})
    })
}

fact = Y.(
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

#Refactor - line things up differently and refactor so they look more similar
