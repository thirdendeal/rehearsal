-- Set
-- ---------------------------------------------------------------------

local linear_search = require("source/algorithm/linear-search")

-- ---------------------------------------------------------------------

local Set = {}

Set.__index = Set

-- ---------------------------------------------------------------------

function Set:new()
  local set = {
    array = {},
    hash = {}
  }

  set = setmetatable(set, self)

  return set
end

-- ---------------------------------------------------------------------

-- Operation

function Set:add(value)
  if not self.hash[value] then
    table.insert(self.array, value)

    self.hash[value] = true
  end
end

function Set:remove(value)
  if self.hash[value] then
    table.remove(self.array, linear_search(self.array, value))

    self.hash[value] = nil
  end
end

-- Information

function Set:is_member(value)
  return not (not self.hash[value])
end

function Set:size()
  return #self.array
end

-- Traversal

function Set:enumerate()
  return self.array
end

function Set:iterate()
  local index = 0

  return function()
    index = index + 1

    return self.array[index]
  end
end

-- ---------------------------------------------------------------------

return Set
