const ZERO = (f) => { return (v) => { return     v   }}
const ONE  = (f) => { return (v) => { return   f(v)  }}
const TWO  = (f) => { return (v) => { return f(f(v)) }}


function toInt(x) {
  return x((v) => { return v + 1 })(0)
}

console.log(to_int(ZERO))
console.log(to_int(ONE))
console.log(to_int(TWO))

// next - subtraction.......... UGH....
