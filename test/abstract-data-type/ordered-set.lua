-- Ordered Set Test Case
-- ---------------------------------------------------------------------

local equal_arrays = require("utility.equal-arrays")

-- ---------------------------------------------------------------------

local OrderedSet = require("source.abstract-data-type.ordered-set")

local ordered_set_1 = OrderedSet:new({1, 2, 3})
local ordered_set_2 = OrderedSet:new()

-- ---------------------------------------------------------------------

ordered_set_2:add(3) -- Ordered Set 2: {3}
ordered_set_2:add(4) -- Ordered Set 2: {3, 4}

ordered_set_2:add(4) -- Ordered Set 2: {3, 4}

-- ---------------------------------------------------------------------

local difference_1 = ordered_set_1 - ordered_set_2
local insersection = ordered_set_1 ^ ordered_set_2

assert(difference_1 + insersection == ordered_set_1)

-- ---------------------------------------------------------------------

assert(ordered_set_2:is_member(4))

ordered_set_2:remove(4) -- Set 2: {3}
ordered_set_2:remove(4) -- Set 2: {3}

assert(ordered_set_1:is_superset(ordered_set_2))
assert(ordered_set_2:is_subset(ordered_set_1))

-- ---------------------------------------------------------------------

assert(equal_arrays(ordered_set_2:enumerate(), {3}))

-- ---------------------------------------------------------------------

local ordered_set_3 = OrderedSet:new()

ordered_set_3:add(4)
ordered_set_3:add(1)
ordered_set_3:add(3)
ordered_set_3:add(2)

-- ---------------------------------------------------------------------

assert(equal_arrays(ordered_set_3:enumerate(), {1, 2, 3, 4}))
