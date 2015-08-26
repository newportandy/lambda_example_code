// This is what we want to implement........

const fact = (x) => {
  if (x == 1) {      // if, true, false
    return 1              // numbers
  } else {           // else
    return x * fact(x-1)  // decrement, multiply, recursion
  }
}

console.log( fact(8) )

// let's start with numbers.....
