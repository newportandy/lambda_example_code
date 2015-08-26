const U = (f) => { return f(f) }
const fact = U((f) => {
  const recursion = (n) => { return f(f)(n) }
  return (x) => {
    if (x == 1) {
      return 1
    } else {
      return x * recursion(x-1)
    }
  }
})
console.log(fact(8))

//Refactor - create a new function and pass the internal function into the block as a new argument
