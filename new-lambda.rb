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

fact10 = ->(fac, x) {
  if x == 1
    1
  else
    x * fact10.(fact10, x-1)
  end
}
puts fact1.(5)
#Refactor -> pass body of factorial function as argument to factorial.....

#fact20 = ->(fac, x) {
  #if x == 1
    #1
  #else
    #x * fac.(fac, x-1)
  #end
#}.(
  #->(fac, x) {
    #if x == 1
      #1
    #else
      #x * fac.(fac, x-1)
    #end
  #}
#)
#won't work - as we evaluate the function straight away we're missing an argument
#What we want is a function that returns the factorial function - curry to the rescue

#Refactor curry so we return a function that takes a function and returns a function
fact2 = (->(f) {
  ->(x) {
    if x == 1
      1
    else
      x * f.(f).(x-1)
    end
  }
}).(
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
puts fact2.(5)

#Refactor - there's some duplication, extract the re-application of the function to itself
U = ->(f) { f.(f) }
fact3 = U.(
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
puts fact3.(5)

#Refactor - extract the reapplicaiton of the function to itself inside the factorial function
fact4 = U.(
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

puts fact4.(5)

#Refactor - extract the reapplicaiton of the function to itself inside the factorial function

Y1 = ->(z) {
  U.(
    ->(f) {
      recursion = ->(n) { f.(f).(n) }
      z.(recursion)
    }
  )
}

fact5 = Y1.(
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

puts fact5.(5)

#Refactor - inline recursion and inline U

Y2 = ->(z) {
  ->(f) { f.(f) }.(
    ->(f) {
      z.(->(n){f.(f).(n)})
    })
}

fact6 = Y2.(
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

puts fact6.(5)

#Refactor - line things up differently and refactor so they look more similar

Z = ->(z) {
  ->(f) {    ->(n){ f.(f).(n) }  }.(
  ->(f) { z.(->(n){ f.(f).(n) }  )})
}

fact7 = Z.( ->(recursion) { ->(x) { x == 1 ? 1 : x * recursion.(x-1) } })
puts fact7.(5)

times2 = ->(x) { x * 2 }
puts times2.(4)
wrapped_times2 = ->(n) { times2.(n) }
puts wrapped_times2.(4)

#other recursion


fib = Z.( ->(recursion) { ->(x) { x < 2 ? x : recursion.(x-1) + recursion.(x-2) } } )
puts fib.(25)

















