-- Binary Search Test Case
-- ---------------------------------------------------------------------

local MockArray = require("mock.array")

-- ---------------------------------------------------------------------

local binary_search = require("source.algorithm.binary-search")

local array = MockArray.ascending(100)

-- ---------------------------------------------------------------------

assert(binary_search(array, 100) == 100)
assert(binary_search(array, 101) == nil)
