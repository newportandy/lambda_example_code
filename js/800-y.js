const Y = (y) =>{
  return (f) => { return f(f)}((f) => {
    return y((n) => { return f(f)(n)})
  })
}

const fact = Y((recur) => {
  return (x) => {
    if (x == 1) {
      return 1
    } else {
      return x * recur(x-1)
    }
  }
})

console.log(fact(8))

//Refactor - line things up differently and refactor so they look more similar
