let

  StartFunction = ()=>1,
  TestFunction  = each (_ <= 10),
  IncrementFunction = each (_ + 1),

  MyList = List.Generate( StartFunction, TestFunction, IncrementFunction)

in
  MyList
