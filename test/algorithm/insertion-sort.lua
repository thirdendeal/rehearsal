-- Insertion Sort Test Case
-- ---------------------------------------------------------------------

local MockArray = require("mock.array")
local UtilityArray = require("utility.array")

-- ---------------------------------------------------------------------

local insertion_sort = require("source.algorithm.insertion-sort")

local array = MockArray.descending(10)
local sorted = MockArray.ascending(10)

insertion_sort(array)

-- ---------------------------------------------------------------------

assert(UtilityArray.equals(array, sorted))
