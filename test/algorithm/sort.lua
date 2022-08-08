-- Sort Test
-- ---------------------------------------------------------------------
--
-- Usage: lua ./test/sort.lua <name> [scenario = worst] [size = 10] [states = 1]

local delete_sufix = require("utility.delete-sufix")
local readlines = require("utility.readlines")
local source_code = require("utility.source-code")

local profile = require("test.algorithm.sort.profile")
local report = require("test.algorithm.sort.report")

-- ---------------------------------------------------------------------

local function build_profile(name, path)
  local pattern = name:gsub("-", "_")
  local lines = readlines(path .. ".lua")

  local chunk_lines = source_code.extract(pattern, lines)

  print(chunk_lines[1])

  return profile(chunk_lines, pattern)
end

-- ---------------------------------------------------------------------

local arguments = {
  sort = delete_sufix(arg[1], "-sort") .. "-sort",
  scenario = arg[2] or "worst",
  size = tonumber(arg[3]) or 10,
  states = tonumber(arg[4]) or 1
}

-- ---------------------------------------------------------------------

local path = "source/algorithm/" .. arguments.sort

local sort = require(path)
local mock = require("mock/" .. sort.input_type)

local input = mock[sort[arguments.scenario]](arguments.size)

-- ---------------------------------------------------------------------

local profile_sort = build_profile(arguments.sort, path)

report(arguments.states, profile_sort(input))
