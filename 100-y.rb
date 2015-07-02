# Simple Ruby factorial
fact1 = ->(x) {
  if x == 1
    1
  else
    x * fact1.(x-1)
  end
}
puts fact1.(5)
#Refactor -> pass factorial function as argument to factorial.....
