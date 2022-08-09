-- Sort
-- ---------------------------------------------------------------------
--
-- Usage: lua ./script/sort.lua <name> [scenario = worst] [size = 10] [states = 1]

local string_ = require("utility.string")

local profile = require("script.sort.profile")
local report = require("script.sort.report")

-- ---------------------------------------------------------------------

local arguments = {
  name = string_.ending(arg[1], "-sort"),
  --
  scenario = arg[2] or "worst",
  size = tonumber(arg[3]) or 10,
  states = tonumber(arg[4]) or 1
}

-- ---------------------------------------------------------------------

local path = "source/algorithm/" .. arguments.name

local sort = require(path)
local mock = require("mock/" .. sort.input_type)

-- ---------------------------------------------------------------------

local function_name = arguments.name:gsub("-", "_")
local function_path = path .. ".lua"

local new_function = profile(function_name, function_path)
local input = mock[sort[arguments.scenario]](arguments.size)

report(arguments.states, new_function(input))
