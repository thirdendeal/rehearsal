-- Delete Sufix
-- ---------------------------------------------------------------------

local function delete_sufix(string, sufix)
  return string:gsub("(.*)" .. sufix, "%1")
end

-- ---------------------------------------------------------------------

return delete_sufix
