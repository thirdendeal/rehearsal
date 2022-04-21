-- Usage: lua bubble-sort.lua [from = 1] [to = 100] [invert]

-- Scenario
--
-- Best:      1 10          -> {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
-- Average:   1 10 invert   -> {-1, 2, -3, 4, -5, 6, -7, 8, -9, 10}
-- Worst:     10 1          -> {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}

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

local function bubble_sort(array)
  local counter = 0

  for i = 1, #array - 1, 1 do -- Passthrough iteration
    local swaped = false

    for j = 1, #array - i, 1 do -- Bubbling iteration
      local a = j
      local b = j + 1

      if array[a] > array[b] then -- Comparison operation
        array[a], array[b] = array[b], array[a] -- Swap operation

        swaped = true
        counter = counter + 1
      end

      counter = counter + 1
    end

    if not swaped then -- Early exit check
      break
    end
  end

  return counter
end

local start_point = tonumber(arg[1]) or 1
local end_point = tonumber(arg[2]) or 100

local invert_flag = arg[3]

local array = range(start_point, end_point, invert_flag)

print(bubble_sort(array, true))
