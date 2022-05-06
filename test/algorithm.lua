-- Algorithm Test
-- ---------------------------------------------------------------------
--
-- Usage: lua ./test/algorithm.lua <name> [scenario = worst] [size = 10]

local package = require("src/algorithm/" .. arg[1])
local mock = require("test/mock/" .. package.input)

local scenario = arg[2] or "worst"
local size = arg[3] or 10

local input = mock[package[scenario]](size)
local profile = package.algorithm(input)

-- ---------------------------------------------------------------------

local length = 0
local sum = 0

for key, value in pairs(profile) do
  if #key > length then
    length = #key
  end

  sum = sum + value
end

local format = "%-" .. length .. "s \t%i\n"

-- ---------------------------------------------------------------------

for operation, count in pairs(profile) do
  io.write(string.format(format, operation, count))
end

print(string.rep("-", length))

io.write(string.format(format, "step", sum))
