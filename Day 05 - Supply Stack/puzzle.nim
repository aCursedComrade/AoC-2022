import strutils, algorithm

let procedure = readFile("input.txt").strip().splitLines()
let plan = readFile("stacks.txt").strip().splitLines()
var stacks: array[9, seq[char]]

# Read "stacks.txt" and parse the stacks
for i in 0..<high(plan):
  let level = plan[i].splitWhitespace()
  for pos in 0..high(level):
    let crate = level[pos][1]
    if crate == '0':
      continue
    stacks[pos].add(crate)

for i in 0..high(stacks):
  stacks[i].reverse()
  #echo stacks[i]

# Part 01
# Follow the procedure and get the top crates (stack operations)
var CM9000 = stacks
for step in procedure.items:
  let n = parseInt(step.splitWhitespace()[1])
  let x = parseInt(step.splitWhitespace()[3]) - 1
  let y = parseInt(step.splitWhitespace()[5]) - 1
  CM9000[y].add(CM9000[x][^n .. ^1].reversed())
  CM9000[x] = CM9000[x][0 ..< ^n]

var word: string
for i in 0..high(stacks):
  word &= $CM9000[i].pop()

echo "Word 01: ",word
word = ""

# Part 02
var CM9001 = stacks
for step in procedure.items:
  let n = parseInt(step.splitWhitespace()[1])
  let x = parseInt(step.splitWhitespace()[3]) - 1
  let y = parseInt(step.splitWhitespace()[5]) - 1
  CM9001[y].add(CM9001[x][^n .. ^1]) # Lol
  CM9001[x] = CM9001[x][0 ..< ^n]

for i in 0..high(stacks):
  word &= $CM9001[i].pop()

echo "Word 02: ",word
