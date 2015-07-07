# This is what we want to implement........

fact = ->(x) {
  if x == 1         # if, true, false
    1               # numbers
  else              # else
    x * fact.(x-1)  # decrement, multiply, recursion
  end
}

puts fact.(8)

# let's start with numbers.....
