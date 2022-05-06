-- Selection Sort
-- ---------------------------------------------------------------------

-- Selection Sort: a loop of comparison passthroughs and swaps, where:
--
-- 1. A comparison passthrough finds the lowest unsorted value
-- 2. If out of place, a swap to the start of the iteration is done
--
-- With every iteration:
--
-- 1. Either one or zero swaps occur

local function selection_sort(array)
  local profile = {
    comparison = 0,
    swap = 0
  }

  for i = 1, #array - 1 do -- Iteration
    local lowest = i

    for j = i + 1, #array do -- Passthrough
      if array[j] < array[lowest] then -- Comparison operation
        lowest = j
      end

      profile.comparison = profile.comparison + 1
    end

    if lowest ~= i then
      array[i], array[lowest] = array[lowest], array[i] -- Swap operation

      profile.swap = profile.swap + 1
    end
  end

  return profile
end

-- ---------------------------------------------------------------------

-- Best-case scenario: Ascending Order
--
-- A comparison for each value in a passthrough, as in the worst-case
--
-- (n - 1 + n - 2 + ... + 1)
-- T(n) - n
-- [(n ^ 2 + n) / 2] - n
-- [(n ^ 2 + n) / 2] - (2n / 2)
-- (n ^ 2 + n - 2n) / 2
--
-- (n ^ 2 - n) / 2

-- ---------------------------------------------------------------------

-- Worst-case scenario: Descending Order
--
-- A comparison for each value in a passthrough
-- A swap for the first half of the passthroughs (floored)
--
-- (n - 1 + n - 2 + ... + 1) + [(n - 1) // 2]
-- (T(n) - n) + (n / 2)
-- {[(n ^ 2 + n) / 2] - n} + (n / 2)
-- [(n ^ 2 + n) / 2] - n + (n / 2)
-- [(n ^ 2 + n) / 2] - (2n / 2) + (n / 2)
-- (n ^ 2 + n - 2n + n ) / 2
--
-- (n ^ 2) // 2

-- ---------------------------------------------------------------------

-- Average-case scenario: Mixed Order
--
-- A comparison for each value in a passthrough, as in the worst-case
-- Half the swaps of the worst-case (+- 1)

-- ---------------------------------------------------------------------

return {
  algorithm = selection_sort,
  --
  input = "array",
  --
  best = "ascending",
  worst = "descending",
  average = "mixed"
}
