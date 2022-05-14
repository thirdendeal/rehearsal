-- Algorithm Test
-- ---------------------------------------------------------------------
--
-- Usage: lua ./test/algorithm.lua <name> [scenario = worst] [size = 10]

local report = require("test/suit/report")

local name = arg[1]
local scenario = arg[2] or "worst"
local size = arg[3] or 10

local package = require("src/algorithm/" .. name)
local mock = require("test/suit/mock/" .. package.input)

local input = mock[package[scenario]](size)

-- ---------------------------------------------------------------------

report(package.algorithm(input))
