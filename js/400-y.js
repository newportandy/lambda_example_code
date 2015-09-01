const fact = (f) => {
  return (x) => {
    if (x === 0) {
      return 1
    } else {
      return x * f(f)(x-1)
    }
  }
}((f) => {
    return (x) => {
      if (x === 0) {
        return 1
      } else {
        return x * f(f)(x-1)
      }
    }
  }
)

console.log(fact(8))

//Refactor - there's some duplication, extract the re-application of the function to itself
