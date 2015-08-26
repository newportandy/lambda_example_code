fact = ->(fac, x) {
  if x == 1
    1
  else
    x * fac.(fac, x-1)
  end
}.(
  ->(fac, x) {
    if x == 1
      1
    else
      x * fac.(fac, x-1)
    end
  }
)
#won't work - as we evaluate the function straight away we're missing an argument
#What we want is a function that returns the factorial function - curry to the rescue

#Refactor curry so we return a function that takes a function and returns a function
