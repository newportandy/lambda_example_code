U = ->(f) { f.(f) }
fact = U.(
  ->(f) {
    recursion = ->(n) {
      f.(f).(n)
    }
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

#Refactor - create a new function and pass the internal function into the block as a new argument
