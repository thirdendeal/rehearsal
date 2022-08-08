-- Sort Test
-- ---------------------------------------------------------------------
--
-- Usage: lua ./script/sort.lua <name> [scenario = worst] [size = 10] [states = 1]

local io_ = require("utility.io")
local source_code = require("utility.source-code")
local string_ = require("utility.string")

local profile = require("script.sort.profile")
local report = require("script.sort.report")

-- ---------------------------------------------------------------------

local function build_profile(name, path)
  local pattern = name:gsub("-", "_")
  local lines = io_.readlines(string_.ending(path, ".lua"))

  local chunk = source_code.find_chunk(lines, pattern)

  return profile(chunk, pattern)
end

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

local profile_func = build_profile(arguments.name, path)
local input = mock[sort[arguments.scenario]](arguments.size)

report(arguments.states, profile_func(input))
