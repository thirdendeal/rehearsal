-- Selection Sort Test Case
-- ---------------------------------------------------------------------

local MockArray = require("mock.array")
local UtilityArray = require("utility.array")

-- ---------------------------------------------------------------------

local selection_sort = require("source.algorithm.selection-sort")

local array = MockArray.descending(10)
local sorted = MockArray.ascending(10)

selection_sort(array)

-- ---------------------------------------------------------------------

assert(UtilityArray.equals(array, sorted))
