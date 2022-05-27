-- Queue Test Case
-- ---------------------------------------------------------------------

local equal_arrays = require("share.equal-arrays")

-- ---------------------------------------------------------------------

local Queue = require("source.abstract-data-type.queue")

local queue = Queue:new()

-- State 1: Empty
-- ---------------------------------------------------------------------

assert(queue:dequeue() == nil) -- Queue: (empty)

queue:enqueue(1) -- Queue: 1

-- State 2: One element
-- ---------------------------------------------------------------------

assert(queue:dequeue() == 1) -- Queue: (empty)

queue:enqueue(2) -- Queue: 2
queue:enqueue(3) -- Queue: 3, 2

-- State 3: More than one element
-- ---------------------------------------------------------------------

assert(queue:dequeue() == 2) -- Queue: 3

queue:enqueue(4) -- Queue: 4, 3
queue:enqueue(5) -- Queue: 5, 4, 3

-- ---------------------------------------------------------------------

assert(equal_arrays(queue:to_array(), {5, 4, 3}))
