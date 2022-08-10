-- Linear Search Test Case
-- ---------------------------------------------------------------------

local MockArray = require("mock.array")

-- ---------------------------------------------------------------------

local linear_search = require("source.algorithm.linear-search")

local array = MockArray.ascending(100)

-- ---------------------------------------------------------------------

assert(linear_search(array, 100) == 100)
assert(linear_search(array, 101) == nil)
