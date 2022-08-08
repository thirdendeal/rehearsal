-- Ordered OrderedSet
-- ---------------------------------------------------------------------

local binary_search = require("source.algorithm.binary-search")

-- ---------------------------------------------------------------------

local Set = require("source.abstract-data-type.set")

local OrderedSet = {}

setmetatable(OrderedSet, Set)

-- ---------------------------------------------------------------------

function OrderedSet:new(elements)
  if elements then
    table.sort(elements)
  end

  return Set.new(self, elements)
end

-- ---------------------------------------------------------------------

function OrderedSet:copy()
  return OrderedSet:new({unpack(self.array)})
end

-- ---------------------------------------------------------------------

function OrderedSet:add(value)
  if not self.hash[value] then
    local _, index = binary_search(self.array, value)

    table.insert(self.array, index + 1, value)

    self.hash[value] = true
  end
end

function OrderedSet:remove(value)
  if self.hash[value] then
    table.remove(self.array, binary_search(self.array, value))

    self.hash[value] = nil
  end
end

-- ---------------------------------------------------------------------

OrderedSet.__index = OrderedSet

OrderedSet.__add = Set.union
OrderedSet.__sub = Set.difference

OrderedSet.__pow = Set.intersection
OrderedSet.__eq = Set.equal

-- ---------------------------------------------------------------------

return OrderedSet
