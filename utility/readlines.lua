-- Read Lines
-- ---------------------------------------------------------------------

local function readlines(filename)
  local lines = {}

  for line in io.lines(filename) do
    table.insert(lines, line)
  end

  return lines
end

-- ---------------------------------------------------------------------

return readlines
