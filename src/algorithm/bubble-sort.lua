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

-- ---------------------------------------------------------------------

local function ascending(size)
  local array = {}

  for i = 1, size, 1 do
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

  for i = 1, midpoint, 1 do
    table.insert(array, i)
  end

  for i = size, midpoint, -1 do
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
