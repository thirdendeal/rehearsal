-- Linear Search
-- ---------------------------------------------------------------------

local function linear_search(array, value)
  for index, element in ipairs(array) do
    if element == value then
      return index
    end
  end
end

-- ---------------------------------------------------------------------

return linear_search
