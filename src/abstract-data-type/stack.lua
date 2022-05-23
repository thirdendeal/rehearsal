-- Stack
-- ---------------------------------------------------------------------

local module = {}

local Stack = {}
local StackMetatable = {
  __index = Stack
}

-- ---------------------------------------------------------------------

function module.new()
  local stack = setmetatable({}, StackMetatable)

  stack.array = {}

  return stack
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

return module
