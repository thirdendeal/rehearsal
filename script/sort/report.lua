-- Report
-- ---------------------------------------------------------------------

local inspect = require("inspect")

local string_ = require("utility.string")

-- ---------------------------------------------------------------------

local function tally(profile)
  local max_length = 0
  local sum = 0

  for key, value in pairs(profile) do
    if #key > max_length then
      max_length = #key
    end

    sum = sum + value
  end

  return max_length, sum
end

local function report(steps, profile, snapshot)
  if steps > 0 and #snapshot > 1 then
    for i = 1, math.min(steps, #snapshot) do
      print(inspect(snapshot[i]))
    end

    print()
  end

  local length, sum = tally(profile)

  local format = "%-" .. length .. "s\t%i\n"

  for operation, count in pairs(profile) do
    string_.printf(format, operation, count)
  end

  print()
  string_.printf(format, "step", sum)
end

-- ---------------------------------------------------------------------

return report
