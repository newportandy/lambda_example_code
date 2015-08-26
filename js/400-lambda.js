const ZERO = (f) => { return (v) => { return     v   }}
const ONE  = (f) => { return (v) => { return   f(v)  }}
const TWO  = (f) => { return (v) => { return f(f(v)) }}

const MULT = (a) => { return (b) => { return (f) => { return a(b(f)) } } }

const FOUR = MULT(TWO)(TWO)
const EIGHT = MULT(FOUR)(TWO)

function toInt(x) {
  return x((v) => { return v + 1 })(0)
}

console.log(toInt(FOUR))
console.log(toInt(EIGHT))

// Next up - boolean logic
