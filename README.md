# Rehearsal

Data Structures and Algorithms study

## Test

```shell
# Usage: lua test/**/*.lua

lua "./test/algorithm/bubble-sort.lua"
```

Output: None (Zero exit status)

## Walk-Through

### Sort

```shell
# Usage: lua script/sort.lua <name> [scenario = worst] [size = 10] [snapshots = 1]

lua "./script/sort.lua" bubble-sort
```

Output:

```
{ 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 }

Comparison operation    45
Iteration               9
Passthrough             9
Swap operation          45

Operation total         90
```
