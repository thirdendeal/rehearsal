-- Bubble Sort
-- ---------------------------------------------------------------------

-- Worst-case scenario comparison and swap count:
--
-- (n - 1 + n - 2 + ... + 1)(1 + 1)
-- = [T(n) - n] 2
-- = {[(n ^ 2 + n) / 2] - n} 2
-- = n ^ 2 + n - 2n
-- = n ^ 2 - n

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

local function ascending(size)
  local array = {}

  for i = 1, size do
    table.insert(array, i)
  end

  return array
end

local function descending(size)
  local array = {}

  for i = size, 1, -1 do
    table.insert(array, i)
  end

  return array
end

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
