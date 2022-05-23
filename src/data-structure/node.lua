-- Node
-- ---------------------------------------------------------------------

local module = {}

local Node = {}
local NodeMetatable = {
  __index = Node
}

-- ---------------------------------------------------------------------

function module.new(data, link)
  local node = setmetatable({}, NodeMetatable)

  node.data = data
  node.link = link

  return node
end

-- ---------------------------------------------------------------------

return module
