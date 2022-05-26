-- Array Mocking
-- ---------------------------------------------------------------------

-- Private
-- ---------------------------------------------------------------------

local function flip_flop(a, b)
  local flip = a
  local flop = b

  return function()
    flip, flop = flop, flip

    return flop
  end
end

-- Public
-- ---------------------------------------------------------------------

local function ascending(size)
  local array = {}

  for i = 1, size do
    table.insert(array, i)
  end

  return array
end

local function cosine_boost(size)
  local array = {}
  local toggle_sign = flip_flop(1, -1)

  for i = 1, size do
    table.insert(array, i * toggle_sign())
  end

  return array
end

local function cosine_damp(size)
  local array = {}
  local toggle_sign = flip_flop(1, -1)

  for i = size, 1, -1 do
    table.insert(array, i * toggle_sign())
  end

  return array
end

local function descending(size)
  local array = {}

  for i = size, 1, -1 do
    table.insert(array, i)
  end

  return array
end

local function mixed(size)
  local midpoint = size / 2

  local array = {}

  for i = 1, midpoint do
    table.insert(array, i)
  end

  for i = size, midpoint + 0.5, -1 do
    table.insert(array, i)
  end

  return array
end

local function pseudo_random(size)
  math.randomseed(os.time())

  local array = {}

  for _ = 1, size do
    table.insert(array, math.random(1, size))
  end

  return array
end

-- ---------------------------------------------------------------------

return {
  ascending = ascending,
  cosine_boost = cosine_boost,
  cosine_damp = cosine_damp,
  descending = descending,
  mixed = mixed,
  pseudo_random = pseudo_random
}
