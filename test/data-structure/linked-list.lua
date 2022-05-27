-- Linked List Test Case
-- ---------------------------------------------------------------------

local equal_ipairs = require("share.equal_ipairs")

-- ---------------------------------------------------------------------

local LinkedList = require("source.data-structure.linked-list")

local linked_list = LinkedList:new()

-- State 1: Empty
-- ---------------------------------------------------------------------

assert(linked_list:delete_at(1) == nil) -- Linked List: (empty)

assert(linked_list:read(1) == nil)
assert(linked_list:search("A") == nil)

linked_list:insert_at(1, "A") -- Linked List: "A"

-- State 2: One element
-- ---------------------------------------------------------------------

assert(linked_list:delete_at(1).data == "A") -- Linked List: (empty)

linked_list:insert_at(1, "B") -- Linked List: "B"

assert(linked_list:read(1).data == "B")
assert(linked_list:search("B") == 1)

linked_list:insert_at(1, "C") -- Linked List: "C", "B"

-- State 3: More than one element
-- ---------------------------------------------------------------------

assert(linked_list:delete_at(2).data == "B") -- Linked List: "C"

linked_list:insert_at(2, "D") -- Linked List: "C", "D"

assert(linked_list:read(2).data == "D")
assert(linked_list:search("D") == 2)

linked_list:insert_at(2, "E") -- Linked List: "C", "E, "D"

-- ---------------------------------------------------------------------

assert(equal_ipairs(linked_list:to_array(), {"C", "E", "D"}))
