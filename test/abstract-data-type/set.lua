-- Set Test Case
-- ---------------------------------------------------------------------

local array = require("utility.array")

-- ---------------------------------------------------------------------

local Set = require("source.abstract-data-type.set")

local set_1 = Set:new({1, 2, 3})
local set_2 = Set:new()

-- ---------------------------------------------------------------------

set_2:add(3) -- Set 2: {3}
set_2:add(4) -- Set 2: {3, 4}

set_2:add(4) -- Set 2: {3, 4}

-- ---------------------------------------------------------------------

local difference_1 = set_1 - set_2
local insersection = set_1 ^ set_2

assert(difference_1 + insersection == set_1)

-- ---------------------------------------------------------------------

assert(set_2:is_member(4))

set_2:remove(4) -- Set 2: {3}
set_2:remove(4) -- Set 2: {3}

assert(set_1:is_superset(set_2))
assert(set_2:is_subset(set_1))

-- ---------------------------------------------------------------------

assert(array.equals(set_2:enumerate(), {3}))
