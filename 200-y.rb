fact = ->(f, x) {
  if x == 1
    1
  else
    x * f.(fact, x-1)
  end
}
puts fact.(fact, 5)
#Refactor -> pass body of factorial function as argument to factorial.....
