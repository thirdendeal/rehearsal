-- Doubly Linked List
-- ---------------------------------------------------------------------

local DoublyLinkedList = {}

DoublyLinkedList.__index = DoublyLinkedList

-- ---------------------------------------------------------------------

function DoublyLinkedList:new()
  local doubly_linked_list = {
    head = nil,
    tail = nil
  }

  return setmetatable(doubly_linked_list, self)
end

-- Node
-- ---------------------------------------------------------------------

local Node = {}

Node.__index = Node

-- ---------------------------------------------------------------------

function Node:new(backward, data, forward, reverse)
  if reverse then
    backward, forward = forward, backward
  end

  local node = {
    backward = backward,
    data = data,
    forward = forward
  }

  return setmetatable(node, self)
end

-- Private
-- ---------------------------------------------------------------------

local function directions(reverse)
  local map = {
    after = "forward",
    before = "backward",
    head = "head",
    tail = "tail"
  }

  if reverse then
    map.head, map.tail = map.tail, map.head

    map.after, map.before = map.before, map.after
  end

  return map
end

-- Public
-- ---------------------------------------------------------------------

function DoublyLinkedList:delete_at(index, reverse)
  local replace = self:read(index, reverse)

  if replace then
    local previous = replace.backward
    local following = replace.forward

    if previous then
      previous.forward = following
    else
      self.head = following
    end

    if following then
      following.backward = previous
    else
      self.tail = previous
    end

    return replace
  end
end

function DoublyLinkedList:insert_at(index, value, reverse)
  local map = directions(reverse)

  if index == 1 and not self.head then
    self.head = Node:new(nil, value, nil)

    self.tail = self.head
  elseif index == 1 then
    local node = Node:new(nil, value, self[map.head], reverse)

    self[map.head][map.before] = node
    self[map.head] = node
  else
    local previous = self:read(index - 1, reverse)

    if previous then
      local node = Node:new(previous, value, previous[map.after], reverse)

      if previous[map.after] then
        previous[map.after][map.before] = node
      else
        self[map.tail] = node
      end

      previous[map.after] = node
    end
  end
end

function DoublyLinkedList:read(index, reverse)
  local count = 1

  for node in self:traverse(reverse) do
    if index == count then
      return node
    end

    count = count + 1
  end
end

function DoublyLinkedList:search(value, reverse)
  local index = 1

  for node in self:traverse(reverse) do
    if node.data == value then
      return index
    end

    index = index + 1
  end
end

function DoublyLinkedList:to_array(reverse)
  local array = {}

  for node in self:traverse(reverse) do
    table.insert(array, node.data)
  end

  return array
end

function DoublyLinkedList:traverse(reverse, node)
  local current =
    node or
    {
      backward = self.tail,
      forward = self.head
    }

  local step = reverse and "backward" or "forward"

  return function()
    current = current[step]

    if current then
      return current
    end
  end
end

-- ---------------------------------------------------------------------

return DoublyLinkedList
