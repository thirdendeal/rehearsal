-- Insertion Sort
-- ---------------------------------------------------------------------

local function insertion_sort(array)
  local profile = {
    comparison = 0,
    swap = 0
  }

  for i = 2, #array do
    local reference = array[i]

    for j = i - 1, 1, -1 do -- Shifting
      profile.comparison = profile.comparison + 1

      if array[j] > reference then
        profile.swap = profile.swap + 1

        array[j], array[j + 1] = array[j + 1], array[j]
      else
        break
      end
    end
  end

  return profile
end

-- ---------------------------------------------------------------------

return {
  algorithm = insertion_sort,
  --
  input = "array",
  --
  best = "ascending",
  worst = "descending",
  average = "mixed"
}
