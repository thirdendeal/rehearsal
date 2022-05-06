-- Bubble Sort
-- ---------------------------------------------------------------------

-- Bubble Sort: a loop of passthroughs

-- Passthrough: a loop of adjacent pairs of unsorted values, where:
--
-- 1. The left value is compared to the right value
-- 2. If the former is greater than the later, they swap positions
--
-- With every passthrough:
--
-- 1. Greater values bubble up to the right
-- 2. The greatest unsorted value bubbles up to its correct position

local function bubble_sort(array)
  local profile = {
    comparison = 0,
    swap = 0
  }

  for i = 1, #array - 1 do -- Iteration
    local sorted = true

    for j = 1, #array - i do -- Passthrough
      if array[j] > array[j + 1] then -- Comparison operation
        array[j], array[j + 1] = array[j + 1], array[j] -- Swap operation

        sorted = false

        profile.swap = profile.swap + 1
      end

      profile.comparison = profile.comparison + 1
    end

    if sorted then
      break
    end
  end

  return profile
end

-- ---------------------------------------------------------------------

-- Best-case scenario
--
-- A comparison for each pair in the first passthrough
--
-- n - 1

local function ascending(size)
  local array = {}

  for i = 1, size do
    table.insert(array, i)
  end

  return array
end

-- Worst-case scenario
--
-- A comparison and a swap for each pair in every passthrough
--
-- 2 . (n - 1 + n - 2 + ... + 1)
-- 2 . [T(n) - n]
-- 2 . {[(n ^ 2 + n) / 2] - n}
-- (n ^ 2 + n) - 2n
--
-- n ^ 2 - n

local function descending(size)
  local array = {}

  for i = size, 1, -1 do
    table.insert(array, i)
  end

  return array
end

-- Average-case scenario
--
-- About half the operations of the worst-case due to early exiting

local function mixed(size)
  local midpoint = size / 2

  local array = {}

  for i = 1, midpoint do
    table.insert(array, i)
  end

  for i = size, midpoint + 0.5, -1 do
    table.insert(array, i)
  end

  return array
end

-- ---------------------------------------------------------------------

return {
  algorithm = bubble_sort,
  average = mixed,
  best = ascending,
  worst = descending
}
