import strutils, sequtils, algorithm

let input = readFile("input.txt").splitLines()
var 
  total = 0
  compare: seq[int] = @[]

# Part 01
# calculate calories of each elf and add it to a sequence
for idx, val in input[0..^1]:
  if (val != ""):
    total = total + val.parseInt()
  if (val == "" or idx == high(input)):
    compare.add(total)
    total = 0

# get the elf with maximum calories
sort(compare, Descending)
echo "Max is ", compare[0]

# Part 02
# get the top 3 elves with highest calories and get the sum
echo "Sum of top 3: ", foldl(compare[0..2], a + b)
