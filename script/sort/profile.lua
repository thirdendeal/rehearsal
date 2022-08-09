-- Profile
-- ---------------------------------------------------------------------

local code = require("utility.code")
local io_ = require("utility.io")
local string_ = require("utility.string")

-- ---------------------------------------------------------------------

local INSERT = {
  HEADER = [[
    local snapshot = {{unpack(array)}}
    local tally = {}
  ]],
  TALLY = "tally.%s = 0",
  COUNT = "tally.%s = tally.%s + 1",
  SNAPSHOT = "table.insert(snapshot, {unpack(array)})",
  FOOTER = "return tally, snapshot",
  RETURN = "return %s"
}

-- ---------------------------------------------------------------------

local function tokenize(comment, chunk, index)
  return {
    name = string_.tokenize(comment),
    chunk_end = code.chunk_end(chunk, index)
  }
end

local function find_tokens(chunk)
  local tokens = {}

  for index, line in ipairs(chunk) do
    local comment = line:match("%-%-(.*)")

    if comment and not line:match('%"' .. comment .. '%"') then
      table.insert(tokens, tokenize(comment, chunk, index))
    end
  end

  table.sort(
    tokens,
    function(a, b)
      return a.chunk_end < b.chunk_end
    end
  )

  return tokens
end

-- ---------------------------------------------------------------------

local function header(lines, tokens)
  local offset = 2

  for line in INSERT.HEADER:gmatch("(.-)\n") do
    table.insert(lines, offset, line)

    offset = offset + 1
  end

  for _, token in ipairs(tokens) do
    table.insert(lines, offset, string.format(INSERT.TALLY, token.name))

    offset = offset + 1
  end
end

local function count(lines, token, offset)
  if token.name == "iteration" then
    offset = offset - 1
  end

  table.insert(
    lines,
    token.chunk_end + offset,
    string.format(INSERT.COUNT, token.name, token.name)
  )
end

local function snapshot(lines, tokens)
  for i = #tokens, 1, -1 do
    local token = tokens[i]

    if token.name:match("_operation$") then
      table.insert(lines, token.chunk_end + 2, INSERT.SNAPSHOT)
    end
  end
end

local function footer(lines, function_name)
  table.insert(lines, #lines, INSERT.FOOTER)
  table.insert(lines, string.format(INSERT.RETURN, function_name))
end

-- ---------------------------------------------------------------------

local function insert_profiler(lines, function_name)
  local tokens = find_tokens(lines)

  for offset, token in ipairs(tokens) do
    count(lines, token, offset)
  end

  snapshot(lines, tokens)

  header(lines, tokens)
  footer(lines, function_name)
end

-- ---------------------------------------------------------------------

local function profile(pattern, path)
  local file = io_.readlines(path)
  local func = code.find_chunk(file, pattern)

  insert_profiler(func, pattern)

  return loadstring(table.concat(func, "\n"))()
end

-- ---------------------------------------------------------------------

return profile
