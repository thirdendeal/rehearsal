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

-- Worst-case scenario: Descending Order
--
-- A comparison and a swap for each pair in every passthrough
--
-- 2 . (n - 1 + n - 2 + ... + 1)
-- 2 . [T(n) - n]
-- 2 . {[(n ^ 2 + n) / 2] - n}
-- (n ^ 2 + n) - 2n
--
-- n ^ 2 - n

-- ---------------------------------------------------------------------

-- Average-case scenario: Pseudo Random Order
--
-- About three quarters of the operations of the worst-case

-- ---------------------------------------------------------------------

-- Best-case scenario: Ascending Order
--
-- A comparison for each pair in the first passthrough
--
-- n - 1

-- ---------------------------------------------------------------------

return {
  algorithm = bubble_sort,
  --
  input = "array",
  --
  worst = "descending",
  average = "pseudo_random",
  best = "ascending"
}
