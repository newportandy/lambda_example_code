const ZERO = (f) => { return (v) => { return     v   }}
const ONE  = (f) => { return (v) => { return   f(v)  }}
const TWO  = (f) => { return (v) => { return f(f(v)) }}

const TRUE  = (x) => { return (y) => { return x } }
const FALSE = (x) => { return (y) => { return y } }

const IS_ZERO = (f) => { return f((v) => { return FALSE })(TRUE) }

function toBool(bool) {
  return bool(true)(false)
}

console.log(toBool(TRUE))
console.log(toBool(FALSE))

console.log(toBool(IS_ZERO(ZERO)))
console.log(toBool(IS_ZERO(TWO)))

// next up - if/else
