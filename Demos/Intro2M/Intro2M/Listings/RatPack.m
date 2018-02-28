let

  RatPack = { "Frank", "Dean", "Sammy" },

  Rat1 = RatPack{0},
  Rat2 = RatPack{1},
  Rat3 = RatPack{2},

  Rat4 = RatPack{4},   // error - index range out of bounds
  Rat5 = RatPack{5}?  // no error - Rat5 equals null

in
  Rat1