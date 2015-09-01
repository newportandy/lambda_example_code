const TWO  = (f) => { return (v) => { return f(f(v)) }}

// WAT.....
const DECREMENT = (n) => {
  return (f) => { return (x) => {
    return n((g) => { return (h) => { return h(g(f))}})((y) => { return x})((y) => { return y })
  }}
}


function toInt(x) {
  return x((v) => { return v + 1 })(0)
}

console.log(toInt(DECREMENT(TWO)))

// next - multiply
