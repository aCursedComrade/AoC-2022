import strutils, tables

let rounds = readFile("input.txt").splitLines()
var total = 0

# Part 01
let A1 = newTable({'X':(1+3),'Y':(2+6),'Z':(3+0)})
let B1 = newTable({'X':(1+0),'Y':(2+3),'Z':(3+6)})
let C1 = newTable({'X':(1+6),'Y':(2+0),'Z':(3+3)})
let scoresV1 = newTable({'A':A1,'B':B1,'C':C1})

for play in rounds.items:
  total += scoresV1[play[0]][play[2]]

echo "Total score (part 1): ", total

# Part 02
total = 0
let A2 = newTable({'X':(3+0),'Y':(1+3),'Z':(2+6)})
let B2 = newTable({'X':(1+0),'Y':(2+3),'Z':(3+6)})
let C2 = newTable({'X':(2+0),'Y':(3+3),'Z':(1+6)})
let scoresV2 = newTable({'A':A2,'B':B2,'C':C2})

for play in rounds.items:
  total += scoresV2[play[0]][play[2]]

echo "Total score (part 2): ", total
