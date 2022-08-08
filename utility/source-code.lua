-- Source Code
-- ---------------------------------------------------------------------

local MISSING_PAIRS = {
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
  for opening, closing in pairs(MISSING_PAIRS) do
    if line:match(opening) then
      return closing
    end
  end
end

local function missing_chunk(stack, line)
  local closing = missing(line)

  if closing then
    table.insert(stack, closing)
  end

  local latest = stack[#stack]

  if latest then
    if line:match(latest) then
      table.remove(stack)
    end
  end
end

local function chunker(lines, start_position)
  start_position = start_position or 1

  local missing_stack = {}

  for position, line in ipairs(lines) do
    if position >= start_position then
      missing_chunk(missing_stack, line)

      if #missing_stack == 0 then
        return position
      end
    end
  end
end

-- ---------------------------------------------------------------------

-- Returns the matched chunk lines

local function extract(pattern, lines)
  local i = nil

  for position, line in ipairs(lines) do
    if line:match(pattern) then
      i = position

      break
    end
  end

  if i then
    local j = chunker(lines, i)

    return {unpack(lines, i, j)}
  end
end

-- ---------------------------------------------------------------------

return {
  chunker = chunker,
  extract = extract
}
