-- Insertion Sort
-- ---------------------------------------------------------------------

-- Insertion Sort: a loop of shifting phases (2.), where:
--
-- 1. The first unsorted value is saved as a reference and removed
-- 2. Left values that are greater than the reference move to the right
--    By comparisons and swaps
--    Until a lesser or equal left value is found
-- 3. The reference is inserted into the gap, whenever it is
--
-- With every iteration:
--
-- 1. The sorted subarray to the left of the reference grows by one

-- Note:
--
-- The conceptual operations of removal, comparison, swap and insertion
-- Are in practice reduced to comparisons and swaps only

local function insertion_sort(array)
  for i = 2, #array do -- Iteration
    local reference = array[i]

    for j = i - 1, 1, -1 do -- Shifting phase
      if array[j] > reference then -- Comparison operation
        array[j], array[j + 1] = array[j + 1], array[j] -- Swap operation

        -- Snapshot
      else
        break
      end
    end
  end
end

-- ---------------------------------------------------------------------

-- Worst-case scenario: Descending Order
--
-- A comparison and a swap for each pair in every shifting phase
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
-- About half of the operations of the worst-case

-- ---------------------------------------------------------------------

-- Best-case scenario: Ascending Order
--
-- A single comparison for each shifting phase
--
-- n - 1

-- ---------------------------------------------------------------------

return {
  algorithm = insertion_sort,
  --
  input_type = "array",
  --
  worst = "descending",
  average = "pseudo_random",
  best = "ascending"
}
