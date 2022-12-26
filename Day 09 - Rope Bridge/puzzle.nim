import strutils, tables, sets

let input = readFile("input.txt").strip()
let guide = newTable({"U":[1, 1],"D":[1, -1],"R":[0, 1],"L":[0, -1]})
var ropelen = 0

proc simulate(input: string, length: int): int =
  var visited = HashSet[array[2, int]]()
  visited.incl([0,0])
  if length == 1: ropelen = length + 1 else: ropelen = length
  var rope = newSeq[array[2, int]](ropelen)

  proc moveTail() =
    for i in 1 .. high(rope):
      var prev = rope[i-1]
      var curr = rope[i]
      let diffx = prev[0] - curr[0]
      let diffy = prev[1] - curr[1]
      if abs(diffx) <= 1 and abs(diffy) <= 1:
        return
      if diffx != 0: curr[0] += diffx div abs(diffx)
      if diffy != 0: curr[1] += diffy div abs(diffy)
      rope[i] = curr
      visited.incl(rope[^1])

  proc moveHead(axis: string, count: int) =
    let dir = guide[axis][0]
    let step = guide[axis][1]
    for i in 1 .. count:
      rope[0][dir] += step
      moveTail()
      #echo rope

  for move in input.splitLines:
    let axis = move.split[0]
    let count = move.split[1].parseInt
    moveHead(axis, count)

  result = visited.len

echo "Number of places visited by Tail (Part 01): ",simulate(input, 1)
echo "Number of places visited by Tail (Part 02): ",simulate(input, 10)
