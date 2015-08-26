const Z = (z) =>{
  return (f) => { return f(f)}
        ((f) => { return z((n) => { return f(f)(n)}) })
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
