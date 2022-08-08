-- Array
-- ---------------------------------------------------------------------

local function equals(array_a, array_b)
  if array_a == array_b then
    return true
  elseif #array_a ~= #array_b then
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
  equals = equals
}
