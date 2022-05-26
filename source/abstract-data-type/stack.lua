-- Stack
-- ---------------------------------------------------------------------

local Stack = {}

Stack.__index = Stack

-- ---------------------------------------------------------------------

function Stack:new()
  local stack = {
    array = {}
  }

  return setmetatable(stack, self)
end

-- ---------------------------------------------------------------------

function Stack:peek()
  return self.array[#self.array]
end

function Stack:pop()
  return table.remove(self.array)
end

function Stack:push(value)
  table.insert(self.array, value)

  return value
end

-- ---------------------------------------------------------------------

return Stack
