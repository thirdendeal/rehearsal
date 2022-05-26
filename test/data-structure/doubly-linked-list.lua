-- Doubly Linked List Test Case
-- ---------------------------------------------------------------------

local DoublyLinkedList = require("source/data-structure/doubly-linked-list")

local doubly_linked_list = DoublyLinkedList:new()

-- ---------------------------------------------------------------------

-- Prepend

doubly_linked_list:insert_at(1, 2)
doubly_linked_list:insert_at(1, 3)
doubly_linked_list:insert_at(1, 5)
doubly_linked_list:insert_at(1, 7)

-- Append - At the first empty index

doubly_linked_list:insert_at(5, 11)
doubly_linked_list:insert_at(6, 11, true)

-- Remove

doubly_linked_list:delete_at(2)

-- ---------------------------------------------------------------------

assert(doubly_linked_list:search(5) == 2)
assert(doubly_linked_list:read(2).data == 5)

for node in doubly_linked_list:traverse() do
  print(node.data)
end
