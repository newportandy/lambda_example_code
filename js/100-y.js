// Simple JS factorial
const fact = (x) => {
  if (x === 0) {
    return 1
  } else {
    return x * fact(x-1)
  }
}

console.log( fact(8) )
//Refactor -> pass factorial function as argument to factorial.....
