const U = (f) => { return f(f) }
const fact = U((f) => {
  const recur = (n) => { return f(f)(n) }
  return (x) => {
    if (x === 0) {
      return 1
    } else {
      return x * recur(x-1)
    }
  }
})
console.log(fact(8))

//Refactor - create a new function and pass the internal function into the block as a new argument
