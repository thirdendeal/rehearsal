-- Sort
-- ---------------------------------------------------------------------
--
-- # Usage: lua script/sort.lua <name> [scenario = worst] [size = 10] [snapshots = 1]

local MockArray = require("mock.array")
local UtilityString = require("utility.string")

local profile = require("script.sort.profile")
local report = require("script.sort.report")

-- ---------------------------------------------------------------------

local arguments = {
  name = UtilityString.ending(arg[1], "-sort"),
  --
  scenario = arg[2] or "worst",
  size = tonumber(arg[3]) or 10,
  snapshots = tonumber(arg[4]) or 1
}

local map = {
  worst = "descending",
  average = "pseudo_random",
  best = "ascending"
}

-- ---------------------------------------------------------------------

local path = "source/algorithm/" .. arguments.name

-- ---------------------------------------------------------------------

local function_name = arguments.name:gsub("-", "_")
local function_path = path .. ".lua"

local new_function = profile(function_name, function_path)
local input = MockArray[map[arguments.scenario]](arguments.size)

report(arguments.snapshots, new_function(input))
