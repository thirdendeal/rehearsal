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

return Node
