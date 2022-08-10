-- Bubble Sort Test Case
-- ---------------------------------------------------------------------

local MockArray = require("mock.array")
local UtilityArray = require("utility.array")

-- ---------------------------------------------------------------------

local bubble_sort = require("source.algorithm.bubble-sort")

local array = MockArray.descending(10)
local sorted = MockArray.ascending(10)

bubble_sort(array)

-- ---------------------------------------------------------------------

assert(UtilityArray.equals(array, sorted))
