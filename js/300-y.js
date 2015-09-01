const fact = (f, x) => {
  if (x === 0) {
    return 1
  } else {
    return x * f(f, x-1)
  }
}((f, x) => {
  if (x === 0) {
    return 1
  } else {
    return x * f(f, x-1)
  }
})

console.log( fact(8) )
//won't work - as we evaluate the function straight away we're going to blow the stack
//before we even define the function.
//
//What we want is a function that returns the factorial function - curry to the rescue

//Refactor curry so we return a function that takes a function and returns a function
