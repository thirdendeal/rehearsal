-- Profile
-- ---------------------------------------------------------------------

local source_code = require("utility.source-code")

-- ---------------------------------------------------------------------

local HEADER = [[
  local snapshot = {{unpack(array)}}
  local tally = {}
]]

local TALLY_FORMAT = "tally.%s = 0"
local COUNT_FORMAT = "tally.%s = tally.%s + 1"

local SNAPSHOT = "table.insert(snapshot, {unpack(array)})"

-- TODO
local FOOTER = "return tally, snapshot"

-- ---------------------------------------------------------------------

local function marked_chunks(lines)
  local entries = {}

  for position, line in ipairs(lines) do
    local comment = line:match("%-%-.*")

    if comment and not line:match('%"' .. comment .. '%"') then
      local token = comment:match("%w+"):lower()
      local chunk_end = source_code.chunk_end(lines, position) or position

      table.insert(entries, {token = token, chunk_end = chunk_end})
    end
  end

  table.sort(
    entries,
    function(a, b)
      return a.chunk_end < b.chunk_end
    end
  )

  return entries
end

-- ---------------------------------------------------------------------

local function insert_header(lines, insertions)
  local offset = 2

  for line in HEADER:gmatch("(.-)\n") do
    table.insert(lines, offset, line)

    offset = offset + 1
  end

  for _, insertion in ipairs(insertions) do
    if insertion.token ~= "snapshot" then
      local line = string.format(TALLY_FORMAT, insertion.token)

      table.insert(lines, offset, line)

      offset = offset + 1
    end
  end
end

local function insert_count(lines, offset, insertion)
  local line = string.format(COUNT_FORMAT, insertion.token, insertion.token)
  local position = insertion.chunk_end + offset

  table.insert(lines, position, line)
end

local function insert_footer(lines, name)
  table.insert(lines, #lines, FOOTER)
  table.insert(lines, "return " .. name)
end

-- ---------------------------------------------------------------------

local function profile_lines(lines, name)
  local map = marked_chunks(lines)

  for offset, insertion in ipairs(map) do
    if insertion.token == "snapshot" then
      table.insert(lines, insertion.chunk_end + offset, SNAPSHOT)
    else
      insert_count(lines, offset, insertion)
    end
  end

  insert_header(lines, map)
  insert_footer(lines, name)

  return lines
end

-- ---------------------------------------------------------------------

local function profile(lines, name)
  local function_lines = table.concat(profile_lines(lines, name), "\n")

  return loadstring(function_lines)()
end

-- ---------------------------------------------------------------------

return profile
