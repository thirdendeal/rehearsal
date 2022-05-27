-- Set
-- ---------------------------------------------------------------------

local linear_search = require("source.algorithm.linear-search")

-- ---------------------------------------------------------------------

local Set = {}

Set.__index = Set

-- ---------------------------------------------------------------------

function Set:new(elements)
  local set = {
    array = elements or {},
    hash = {}
  }

  if elements then
    for _, element in ipairs(elements) do
      set.hash[element] = true
    end
  end

  set = setmetatable(set, self)

  return set
end

-- ---------------------------------------------------------------------

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

-- ---------------------------------------------------------------------

function Set:copy()
  return Set:new({unpack(self.array)})
end

-- ---------------------------------------------------------------------

function Set:difference(given_set)
  local copy = self:copy()

  for element in given_set:iterate() do
    copy:remove(element)
  end

  return copy
end

function Set:intersection(given_set)
  local new_set = Set:new()

  for element in given_set:iterate() do
    if self:is_member(element) and given_set:is_member(element) then
      new_set:add(element)
    end
  end

  return new_set
end

function Set:union(given_set)
  local copy = self:copy()

  for element in given_set:iterate() do
    copy:add(element)
  end

  return copy
end

-- ---------------------------------------------------------------------

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

function Set:size()
  return #self.array
end

-- ---------------------------------------------------------------------

function Set:are_equal(given_set)
  if self:size() ~= given_set:size() then
    return false
  else
    for element in given_set:iterate() do
      if not self:is_member(element) then
        return false
      end
    end

    return true
  end
end

function Set:is_member(value)
  return self.hash[value] and true or false
end

function Set:is_superset(given_set)
  for element in given_set:iterate() do
    if not self:is_member(element) then
      return false
    end
  end

  return true
end

-- ---------------------------------------------------------------------

return Set
