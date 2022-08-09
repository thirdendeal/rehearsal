-- String
-- ---------------------------------------------------------------------

local function delete_sufix(string, sufix)
  return string:gsub("(.*)" .. sufix, "%1")
end

local function ending(string, sufix)
  return delete_sufix(string, sufix) .. sufix
end

-- ---------------------------------------------------------------------

local function lstrip(string)
  return string:gsub("^%s+(.*)", "%1")
end

local function rstrip(string)
  return string:gsub("(.-)%s+$", "%1")
end

local function strip(string)
  return rstrip(lstrip(string))
end

-- ---------------------------------------------------------------------

local function printf(...)
  io.write(string.format(...))
end

-- ---------------------------------------------------------------------

local function tokenize(string)
  string = lstrip(string)
  string = string:gsub("[%s|-]", "_")

  return string:lower()
end

-- ---------------------------------------------------------------------

return {
  delete_sufix = delete_sufix,
  ending = ending,
  lstrip = lstrip,
  printf = printf,
  rstrip = rstrip,
  strip = strip,
  tokenize = tokenize
}
