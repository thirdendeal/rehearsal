-- Utility
-- ---------------------------------------------------------------------

local function equal_ipairs(array_a, array_b)
  if #array_a ~= #array_b then
    return false
  else
    for i = 1, #array_a do
      if array_a[i] ~= array_b[i] then
        return false
      end
    end

    return true
  end
end

-- ---------------------------------------------------------------------

return {
  equal_ipairs = equal_ipairs
}
