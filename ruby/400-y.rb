fact = ->(f) {
  ->(x) {
    if x == 1
      1
    else
      x * f.(f).(x-1)
    end
  }
}.(
  ->(f) {
    ->(x) {
      if x == 1
        1
      else
        x * f.(f).(x-1)
      end
    }
  }
)
puts fact.(8)

#Refactor - there's some duplication, extract the re-application of the function to itself
