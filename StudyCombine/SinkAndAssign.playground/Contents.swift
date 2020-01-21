import Combine

let publihser = [1, 2, 3, 4, 5].publisher

_ = publihser.sink(receiveCompletion: { err in
  print("Error : \(err)")
}, receiveValue: { value in
  print("Value : \(value)")
})
