-- Stack Test Case
-- ---------------------------------------------------------------------

local Stack = require("src/abstract-data-type/stack")

local stack = Stack:new()

-- ---------------------------------------------------------------------

stack:push(2)
stack:push(3)
stack:push(5)
stack:push(7)

-- ---------------------------------------------------------------------

assert(stack:peek() == 7)

assert(stack:pop() == 7)
assert(stack:pop() == 5)

assert(stack:peek() == 3)
