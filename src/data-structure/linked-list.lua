-- Linked List
-- ---------------------------------------------------------------------

local LinkedList = {}

LinkedList.__index = LinkedList

-- ---------------------------------------------------------------------

function LinkedList:new()
  local linked_list = {
    head = nil
  }

  return setmetatable(linked_list, self)
end

-- Node
-- ---------------------------------------------------------------------

local Node = {}

Node.__index = Node

-- ---------------------------------------------------------------------

function Node:new(data, link)
  local node = {
    data = data,
    link = link
  }

  return setmetatable(node, self)
end

-- ---------------------------------------------------------------------

function LinkedList:delete_at(index)
  if index == 1 then
    if self.head then
      self.head = self.head.link
    end
  else
    local previous = self:read(index - 1)

    if previous then
      local following = previous.link

      if following then
        previous.link = following.link
      end
    end
  end
end

function LinkedList:insert_at(index, value)
  if index == 1 then
    self.head = Node:new(value, self.head)
  else
    local previous = self:read(index - 1)

    if previous then
      previous.link = Node:new(value, previous.link)
    end
  end
end

function LinkedList:read(index)
  local count = 1

  for node in self:traverse() do
    if index == count then
      return node
    end

    count = count + 1
  end
end

function LinkedList:search(value)
  local index = 1

  for node in self:traverse() do
    if node.data == value then
      return index
    end

    index = index + 1
  end
end

function LinkedList:traverse()
  local current = {
    link = self.head
  }

  return function()
    current = current.link

    if current then
      return current
    end
  end
end

-- ---------------------------------------------------------------------

return LinkedList
