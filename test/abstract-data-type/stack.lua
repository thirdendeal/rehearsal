-- Stack Test Case
-- ---------------------------------------------------------------------

local Stack = require("source/abstract-data-type/stack")

local stack = Stack:new()

-- State 1: Empty
-- ---------------------------------------------------------------------

assert(stack:peek() == nil)
assert(stack:pop() == nil)

assert(stack:push(1) == 1)

-- State 2: One element
-- ---------------------------------------------------------------------

assert(stack:peek() == 1)
assert(stack:pop() == 1)

stack:push(1)

assert(stack:push(2) == 2)

-- State 3: More than one element
-- ---------------------------------------------------------------------

assert(stack:peek() == 2)
assert(stack:pop() == 2)

stack:push(2)

assert(stack:push(3) == 3)
