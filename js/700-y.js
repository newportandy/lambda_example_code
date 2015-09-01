const U = (f) => { return f(f) }
const Z = (z) =>{
  return U((f) => {
    const recur = (n) => { return f(f)(n) }
    return z(recur)
  })
}

const fact = Z((recur) => {
  return (x) => {
    if (x === 0) {
      return 1
    } else {
      return x * recur(x-1)
    }
  }
})

console.log(fact(8))

//Refactor - inline recursion and inline U
