-- String
-- ---------------------------------------------------------------------

local function delete_sufix(string, sufix)
  return string:gsub("(.*)" .. sufix, "%1")
end

local function ending(string, sufix)
  return delete_sufix(string, sufix) .. sufix
end

local function printf(...)
  io.write(string.format(...))
end

-- ---------------------------------------------------------------------

return {
  delete_sufix = delete_sufix,
  ending = ending,
  printf = printf
}
