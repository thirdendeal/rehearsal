-- Usage: lua bubble-sort.lua [from = 1] [to = 100] [invert]

-- Scenario
--
-- Best:      1 10          -> {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
-- Average:   1 10 invert   -> {-1, 2, -3, 4, -5, 6, -7, 8, -9, 10}
-- Worst:     10 1          -> {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

local bubble_sort = require("bubble-sort")

local function toggle(a, b)
  return function()
    a, b = b, a

    return b
  end
end

local function range(a, b, invert)
  local step = (a > b and -1 or 1)
  local sign = toggle((invert and -1 or 1), 1)

  local array = {}

  for i = a, b, step do
    table.insert(array, i * sign())
  end

  return array
end

local start_point = tonumber(arg[1]) or 1
local end_point = tonumber(arg[2]) or 100

local invert_flag = arg[3]

local array = range(start_point, end_point, invert_flag)

print(bubble_sort(array, true))
