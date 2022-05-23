-- Linked List Test Case
-- ---------------------------------------------------------------------

local LinkedList = require("src/data-structure/linked-list")

local linked_list = LinkedList:new()

-- ---------------------------------------------------------------------

linked_list:insert_at(1, 2)
linked_list:insert_at(1, 3)
linked_list:insert_at(1, 5)
linked_list:insert_at(1, 7)

linked_list:delete_at(2)

-- ---------------------------------------------------------------------

assert(linked_list:search(3) == 2)
assert(linked_list:read(2).data == 3)

for node in linked_list:traverse() do
  assert(node.data)
end
