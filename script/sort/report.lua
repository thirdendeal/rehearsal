-- Report
-- ---------------------------------------------------------------------

local inspect = require("inspect")

local string_ = require("utility.string")

-- ---------------------------------------------------------------------

local function sorted_keys(pairs_table)
  local keys = {}

  for key, _ in pairs(pairs_table) do
    table.insert(keys, key)
  end

  table.sort(keys)

  return keys
end

local function ordered_pairs(pairs_table)
  local keys = sorted_keys(pairs_table)

  local index = 1

  return function()
    local key = keys[index]

    if key then
      index = index + 1

      return key, pairs_table[key]
    end
  end
end

-- ---------------------------------------------------------------------

local function skim(tally)
  local max_length = 0
  local total = 0

  for name, count in pairs(tally) do
    if #name > max_length then
      max_length = #name
    end

    if name:match("_operation$") then
      total = total + count
    end
  end

  return max_length, total
end

-- ---------------------------------------------------------------------

local function snapshots(states, snapshot)
  local maximum = math.min(states, #snapshot)

  for i = 1, maximum do
    print(inspect(snapshot[i]))
  end

  if maximum > 0 then
    print()
  end
end

local function summary(tally)
  local length, total = skim(tally)

  local format = "%-" .. length .. "s    %i\n"

  for name, count in ordered_pairs(tally) do
    string_.printf(format, string_.untokenize(name), count)
  end

  if total > 0 then
    print()

    string_.printf(format, "Operation total", total)
  end
end
-- ---------------------------------------------------------------------

local function report(states, tally, snapshot)
  snapshots(states, snapshot)
  summary(tally)
end

-- ---------------------------------------------------------------------

return report
