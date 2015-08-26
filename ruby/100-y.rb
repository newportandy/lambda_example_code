# Simple Ruby factorial
fact = ->(x) {
  if x == 1
    1
  else
    x * fact.(x-1)
  end
}
puts fact.(8)
#Refactor -> pass factorial function as argument to factorial.....
