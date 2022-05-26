-- Report
-- ---------------------------------------------------------------------

-- Private
-- ---------------------------------------------------------------------

local function print_array(array)
  io.write("{")

  for i = 1, #array - 1 do
    io.write(array[i], ", ")
  end

  io.write(array[#array], "}\n")
end

local function printf(...)
  io.write(string.format(...))
end

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

-- Public
-- ---------------------------------------------------------------------

local function report(steps, profile, snapshot)
  if steps > 0 and #snapshot > 1 then
    for i = 1, math.min(steps, #snapshot) do
      print_array(snapshot[i])
    end

    print()
  end

  local length, sum = tally(profile)

  local format = "%-" .. length .. "s\t%i\n"

  for operation, count in pairs(profile) do
    printf(format, operation, count)
  end

  print()
  printf(format, "step", sum)
end

-- ---------------------------------------------------------------------

return report
