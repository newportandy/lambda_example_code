const fact = (f, x) => {
  if (x === 0) {
    return 1
  } else {
    return x * f(f, x-1)
  }
}

console.log( fact(fact, 8) )
//Refactor -> pass body of factorial function as argument to factorial.....
