-- Binary Search Tree
-- ---------------------------------------------------------------------

local equal_arrays = require("share.equal-arrays")

-- ---------------------------------------------------------------------

local BinarySearchTree = require("source.data-structure.binary-search-tree")

local bst = BinarySearchTree:new()

-- ---------------------------------------------------------------------

bst:add(8)

-- 8

bst:add(4)
bst:add(12)

--    8
-- 4    12

bst:add(2)
bst:add(6)
bst:add(10)
bst:add(14)

--        8
--    4       12
-- 2    6   10  14

bst:add(1)
bst:add(3)
bst:add(5)
bst:add(7)
bst:add(9)
bst:add(11)
bst:add(13)
bst:add(15)

--                  8
--        4                   12
--    2       6         10        14
-- 1    3   5   7     9   11    13  15

-- ---------------------------------------------------------------------

bst:remove(15)

-- Leaf node 15 removed:
--
--                  8
--        4                   12
--    2       6         10        14
-- 1    3   5   7     9   11    13  __

bst:remove(14)

-- Node with one child 14 removed:
--
--                  8
--        4                   12
--    2       6         10        _13_
-- 1    3   5   7     9   11    __

bst:remove(10)

-- Node with two children 10 removed:
--
--                  8
--        4                   12
--    2       6         _11_      13
-- 1    3   5   7     9   __

bst:remove(4)

-- Node with a subtree 4 removed:
--
--                  8
--       _5_                 12
--    2       6         11        13
-- 1    3   _   7     9

bst:remove(8)

-- Root node 8 removed:
--
--                 _9_
--        5                   12
--    2       6         11        13
-- 1    3       7     _

bst:remove(9)

-- Root node 9 removed:
--
--                _11_
--        5                   12
--    2       6         __        13
-- 1    3       7

bst:remove(11)

-- Root node 11 removed:
--
--                _12_
--        5                   _13_
--    2       6
-- 1    3       7

bst:remove(12)

-- Root node 12 removed:
--
--                  _13_
--        5                   __
--    2       6
-- 1    3       7

bst:remove(13)

-- Root node 13 removed:
--
--                  __
--        5
--    2       6
-- 1    3       7

-- ---------------------------------------------------------------------

local breath_first_collect = {}

for node in bst:traverse(true) do
  table.insert(breath_first_collect, node.value)
end

-- ---------------------------------------------------------------------

assert(equal_arrays(breath_first_collect, {5, 2, 6, 1, 3, 7}))
