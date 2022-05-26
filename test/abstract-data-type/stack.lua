-- Stack Test Case
-- ---------------------------------------------------------------------

local equal_ipairs = require("share/equal_ipairs")

-- ---------------------------------------------------------------------

local Stack = require("source/abstract-data-type/stack")

local stack = Stack:new()

-- State 1: Empty
-- ---------------------------------------------------------------------

assert(stack:pop() == nil) -- Stack: (empty)

stack:push(1) -- Stack: 1

-- State 2: One element
-- ---------------------------------------------------------------------

assert(stack:pop() == 1) -- Stack: (empty)

stack:push(2) -- Stack: 2
stack:push(3) -- Stack: 2, 3

-- State 3: More than one element
-- ---------------------------------------------------------------------

assert(stack:pop() == 3) -- Stack: 2

stack:push(4) -- Stack: 2, 4
stack:push(5) -- Stack: 2, 4, 5

-- ---------------------------------------------------------------------

assert(equal_ipairs(stack.array, {2, 4, 5}))
