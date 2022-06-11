-- Binary Search Tree
-- ---------------------------------------------------------------------

local Queue = require("source.abstract-data-type.queue")
local Stack = require("source.abstract-data-type.stack")

-- ---------------------------------------------------------------------

local BinarySearchTree = {}
local Node = {}

BinarySearchTree.__index = BinarySearchTree
Node.__index = Node

BinarySearchTree.Node = Node

-- ---------------------------------------------------------------------

function BinarySearchTree:new()
  local binary_search_tree = {
    root = nil
  }

  return setmetatable(binary_search_tree, self)
end

-- ---------------------------------------------------------------------

function Node:new(value)
  local node = {
    value = value,
    --
    left = nil,
    right = nil
  }

  return setmetatable(node, self)
end

-- ---------------------------------------------------------------------

function Node:has_child()
  return self.left or self.right
end

function Node:has_children()
  return self.left and self.right
end

function Node:replace(child, node)
  if self.left == child then
    self.left = node
  elseif self.right == child then
    self.right = node
  end
end

function Node:mimic(node)
  if not self.left and node.left ~= self then
    self.left = node.left
  end

  if not self.right and node.right ~= self then
    self.right = node.right
  end
end

function Node:unlink(node)
  if self.left == node then
    self.left = nil
  elseif self.right == node then
    self.right = nil
  end
end

-- ---------------------------------------------------------------------

-- Insertion

local function insert(receiver, node)
  if receiver.value > node.value then
    if receiver.left then
      insert(receiver.left, node)
    else
      receiver.left = node
    end
  else
    if receiver.right then
      insert(receiver.right, node)
    else
      receiver.right = node
    end
  end
end

local function replace(receiver, node, replacement)
  if node.left and node.left ~= replacement then
    insert(replacement, node.left)
  end

  if node.right and node.right ~= replacement then
    insert(replacement, node.right)
  end

  receiver:replace(node, replacement)
end

-- Deletion

local function unlink_successor(node)
  local successor_parent = node
  local successor = node.right

  while successor.left do
    successor_parent = successor

    successor = successor.left
  end

  successor_parent:unlink(successor)

  if successor.right then
    insert(successor_parent, successor.right)
  end

  return successor
end

local function replacement(node)
  if node:has_children() then
    return unlink_successor(node)
  elseif node:has_child() then
    return node.left or node.right
  end
end

-- Search

local function binary_search(node, value)
  local previous = nil
  local current = node

  while current do
    if current.value == value then
      return current, previous
    end

    previous = current

    if current.value > value then
      current = current.left
    else
      current = current.right
    end
  end

  return nil, previous
end

-- Traversal

local function breath_first_traverse(node)
  local queue = Queue:new()
  local current = node

  return function()
    if current ~= nil then
      local yield = current

      if current.left then
        queue:enqueue(current.left)
      end

      if current.right then
        queue:enqueue(current.right)
      end

      current = queue:dequeue()

      return yield
    end
  end
end

local function depth_first_traverse(node)
  local stack = Stack:new()
  local current = node

  return function()
    if current ~= nil then
      local yield = current

      if current.right then
        stack:push(current.right)
      end

      if current.left then
        current = current.left
      else
        current = stack:pop()
      end

      return yield
    end
  end
end

-- ---------------------------------------------------------------------

function BinarySearchTree:add(value)
  local node = Node:new(value)

  if self.root then
    local found, closest = self:search(value)

    if not found then
      insert(closest, node)
    end
  else
    self.root = node
  end
end

function BinarySearchTree:remove(value)
  local found, found_parent = self:search(value)

  local node = replacement(found)

  if found_parent then
    if node then
      replace(found_parent, found, node)
    else
      found_parent:unlink(found)
    end
  else
    if node then
      node:mimic(self.root)
    end

    self.root = node
  end

  return found
end

function BinarySearchTree:search(value)
  return binary_search(self.root, value)
end

function BinarySearchTree:traverse(breath_first, node)
  node = node or self.root

  if breath_first then
    return breath_first_traverse(node)
  else
    return depth_first_traverse(node)
  end
end

-- ---------------------------------------------------------------------

return BinarySearchTree
