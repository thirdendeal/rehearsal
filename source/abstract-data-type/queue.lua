-- Queue
-- ---------------------------------------------------------------------

local DoublyLinkedList = require("source.data-structure.doubly-linked-list")

-- ---------------------------------------------------------------------

local Queue = {}

Queue.__index = Queue

-- ---------------------------------------------------------------------

function Queue:new()
  local queue = {
    dll = DoublyLinkedList:new()
  }

  return setmetatable(queue, self)
end

-- ---------------------------------------------------------------------

function Queue:dequeue()
  local node = self.dll:delete_at(1, true)

  if node then
    return node.data
  end
end

function Queue:enqueue(value)
  self.dll:insert_at(1, value)
end

function Queue:enumerate()
  return self.dll:enumerate()
end

-- ---------------------------------------------------------------------

return Queue
