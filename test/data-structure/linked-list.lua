-- Linked List Test Case
-- ---------------------------------------------------------------------

local LinkedList = require("source/data-structure/linked-list")

local linked_list = LinkedList:new()

-- ---------------------------------------------------------------------

-- Prepend

linked_list:insert_at(1, 2)

linked_list:insert_at(1, 3)
linked_list:insert_at(1, 5)
linked_list:insert_at(1, 7)

-- Append - At the first empty index

linked_list:insert_at(5, 11)

-- Remove

linked_list:delete_at(2)
linked_list:delete_at(4)

-- ---------------------------------------------------------------------

assert(linked_list:search(3) == 2)
assert(linked_list:read(2).data == 3)

for node in linked_list:traverse() do
  assert(node.data)
end
