const ZERO = (f) => { return (v) => { return     v   }}
const ONE  = (f) => { return (v) => { return   f(v)  }}
const TWO  = (f) => { return (v) => { return f(f(v)) }}

const DECREMENT = (n) => {
  return (f) => { return (x) => {
    return n((g) => { return (h) => { return h(g(f))}})((y) => { return x})((y) => { return y })
  }}}

const MULT = (a) => { return (b) => { return (f) => { return a(b(f)) } } }

const FOUR = MULT(TWO)(TWO)
const EIGHT = MULT(FOUR)(TWO)

const TRUE  = (x) => { return (y) => { return x } }
const FALSE = (x) => { return (y) => { return y } }

const IS_ZERO = (f) => { return f((v) => { return FALSE })(TRUE)}

const IF = (bool) => {  return bool }

const Z = (z) =>{
  return (f) => { return f(f)}
        ((f) => { return z((n) => { return f(f)(n)}) })
}

const FACT = Z(
  (recur) => {
    return (x) => {
      return IF(IS_ZERO(x))(
        (z) => { return ONE(z) }
      )(
        (z) => { return  MULT(x)(recur(DECREMENT(x)))(z) }
      )
    }
  }
)

function toInt(x) {
  return x((v) => { return v + 1 })(0)
}
// Delay evaluation of returned numbers

console.log(toInt(FACT(EIGHT)))
