-- Source Code
-- ---------------------------------------------------------------------

local OPEN_CLOSE = {
  ["elseif"] = false,
  --
  ["do"] = "end",
  ["for"] = "end",
  ["function"] = "end",
  ["if"] = "end",
  ["repeat"] = "until"
}

-- ---------------------------------------------------------------------

local function missing(line)
  for opening, closing in pairs(OPEN_CLOSE) do
    if line:match(opening) then
      return closing
    end
  end
end

local function pop(stack, line)
  local top = stack[#stack]

  if top then
    if line:match(top) then
      table.remove(stack)
    end
  end
end

local function push(stack, line)
  local word = missing(line)

  if word then
    table.insert(stack, word)
  end
end

-- ---------------------------------------------------------------------

local function chunk_end(lines, start)
  start = start or 1

  local stack = {}

  for index, line in ipairs(lines) do
    if index >= start then
      push(stack, line)
      pop(stack, line)

      if #stack == 0 then
        return index
      end
    end
  end
end

-- ---------------------------------------------------------------------

local function find_chunk(lines, pattern)
  local i = nil

  for index, line in ipairs(lines) do
    if line:match(pattern) then
      i = index

      break
    end
  end

  if i then
    local j = chunk_end(lines, i)

    return {unpack(lines, i, j)}
  end
end

-- ---------------------------------------------------------------------

return {
  chunk_end = chunk_end,
  find_chunk = find_chunk
}
