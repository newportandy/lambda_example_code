function toInt(x) {
  return x((v) => { return v + 1 })(0)
}

console.log(toInt( (z) =>{
  return (f) => { return f(f)}
        ((f) => { return z((n) => { return f(f)(n)}) })
}(
  (recur) => {
    return (x) => {
      return (bool) => { return bool }
        ((f) => { return f((v) => { return (x) => { return (y) => { return y } } })((x) => { return (y) => { return x } })}(x))(
        (z) => { return (f) => { return (v) => { return   f(v)  }}(z) }
      )(
      (z) => { return  (a) => { return (b) => { return (f) => { return a(b(f)) } } }(x)(recur(
        (n) => {
  return (f) => { return (x) => {
    return n((g) => { return (h) => { return h(g(f))}})((y) => { return x})((y) => { return y })
  }}}(x)))(z) }
      )
    }
  }
)((a) => { return (b) => { return (f) => { return a(b(f)) } } }((a) => { return (b) => { return (f) => { return a(b(f)) } } }((f) => { return (v) => { return f(f(v)) }})((f) => { return (v) => { return f(f(v)) }}))((f) => { return (v) => { return f(f(v)) }}))))
