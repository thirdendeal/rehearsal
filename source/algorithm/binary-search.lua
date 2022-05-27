-- Binary Search
-- ---------------------------------------------------------------------

-- Private
-- ---------------------------------------------------------------------

local function partiton(array, value, a, b)
  local index = math.floor((a + b) / 2)

  if a > b then
    return nil, index
  end

  if array[index] == value then
    return index
  elseif array[index] < value then
    a, b = index + 1, b
  else
    a, b = a, index - 1
  end

  return partiton(array, value, a, b)
end

-- Public
-- ---------------------------------------------------------------------

local function binary_search(sorted_array, value)
  return partiton(sorted_array, value, 1, #sorted_array)
end

-- ---------------------------------------------------------------------

return binary_search
