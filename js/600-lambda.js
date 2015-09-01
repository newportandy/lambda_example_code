const ZERO = (f) => { return (v) => { return     v   }}
const ONE  = (f) => { return (v) => { return   f(v)  }}
const TWO  = (f) => { return (v) => { return f(f(v)) }}

const TRUE  = (x) => { return (y) => { return x } }
const FALSE = (x) => { return (y) => { return y } }

const IS_ZERO = (f) => { return f((v) => { return FALSE })(TRUE) }

const IF = (bool) => {  return bool }

console.log(IF(IS_ZERO(ZERO))("TRUE!!!")("FALSE"))

console.log(IF(IS_ZERO(ONE))("TRUE!!!")("FALSE"))

//  We've got everything we need - except recursion...
