const U = (f) => { return f(f) }
const fact = U((f) => {
  return (x) => {
    if (x === 0) {
      return 1
    } else {
      return x * f(f)(x-1)
    }
  }
})
console.log(fact(8))

//Refactor - extract the reapplicaiton of the function to itself inside the factorial function
