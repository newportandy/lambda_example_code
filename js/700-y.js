const U = (f) => { return f(f) }
const Z = (z) =>{
  return U((f) => {
    const recursion = (n) => { return f(f)(n) }
    return z(recursion)
  })
}

const fact = Z((recur) => {
  return (x) => {
    if (x == 1) {
      return 1
    } else {
      return x * recur(x-1)
    }
  }
})

console.log(fact(8))

//Refactor - inline recursion and inline U
