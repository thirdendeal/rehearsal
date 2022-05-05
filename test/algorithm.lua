-- Usage: lua algorithm.lua <name> [scenario = worst] [size = 10]

local package = require("src/algorithm/" .. arg[1])

local scenario = arg[2] or "worst"
local size = arg[3] or 10

local input = package[scenario](size)

print(package.algorithm(input))
