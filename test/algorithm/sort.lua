-- Algorithm Test
-- ---------------------------------------------------------------------
--
-- Usage: lua ./test/algorithm.lua <name> [scenario = worst] [size = 10]

local report = require("share/report")

local name = arg[1]
local scenario = arg[2] or "worst"
local size = tonumber(arg[3]) or 10
local steps = tonumber(arg[4]) or 0

local package = require("source/algorithm/" .. name)
local mock = require("mock/" .. package.input)

local input = mock[package[scenario]](size)

-- ---------------------------------------------------------------------

report(steps, package.algorithm(input))
