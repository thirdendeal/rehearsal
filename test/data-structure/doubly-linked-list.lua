-- Doubly Linked List Test Case
-- ---------------------------------------------------------------------

local equal_arrays = require("utility.equal-arrays")

-- ---------------------------------------------------------------------

local DoublyLinkedList = require("source.data-structure.doubly-linked-list")

local dll = DoublyLinkedList:new()

-- State 1: Empty
-- ---------------------------------------------------------------------

assert(dll:delete_at(1) == nil) -- Doubly Linked List: (empty)

assert(dll:read(1) == nil)
assert(dll:search("A") == nil)

dll:insert_at(1, "A") -- Doubly Linked List: "A"

-- State 2: One element
-- ---------------------------------------------------------------------

assert(dll:delete_at(1, true).data == "A") -- Doubly Linked List: (empty)

dll:insert_at(1, "B", true) -- Doubly Linked List: "B"

assert(dll:read(1, true).data == "B")
assert(dll:search("B", true) == 1)

dll:insert_at(1, "C") -- Doubly Linked List: "C", "B"

-- State 3: More than one element
-- ---------------------------------------------------------------------

assert(dll:delete_at(2).data == "B") -- Doubly Linked List: "C"

dll:insert_at(2, "D", true) -- Doubly Linked List: "D", "C"

assert(dll:read(2).data == "C")
assert(dll:search("C") == 2)

dll:insert_at(2, "E") -- Doubly Linked List: "D", "E", "C"

-- ---------------------------------------------------------------------

assert(equal_arrays(dll:enumerate(), {"D", "E", "C"}))
