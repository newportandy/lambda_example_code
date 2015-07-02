U = ->(f) { f.(f) }
fact = U.(
  ->(f) {
    ->(x) {
      if x == 1
        1
      else
        x * f.(f).(x-1)
      end
    }
  }
)
puts fact.(5)

#Refactor - extract the reapplicaiton of the function to itself inside the factorial function
