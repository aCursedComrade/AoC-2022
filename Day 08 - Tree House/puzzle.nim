import strutils, sequtils

let inputTrees = readFile("input.txt").strip()

type Tree = object
  up: int
  down: int
  left: int
  right: int
  visible: bool

iterator checkTrees(input: string): Tree =
  let matrix = input.splitLines.mapIt(it.mapIt(($it).parseInt.uint8))

  # Special function to compare heights along a given axis
  # some variables are declared further below
  template check(pos, iter, field, val) =
    var edge = true
    for pos in iter:
      inc tree.field
      if val >= matrix[row][col]:
        edge = false
        break
    if edge:
      tree.visible = true

  # evaluate grid 
  for row in matrix.low .. matrix.high:
    for col in matrix[row].low .. matrix[row].high:
      var tree = Tree()

      # checks upwards along a column (nrow decrease)
      check(nrow, countdown(row-1, matrix.low), up, matrix[nrow][col])

      # checks downwards along a column (nrow increase)
      check(nrow, countup(row+1, matrix.high), down, matrix[nrow][col])

      # checks left along a row (ncol decrease)
      check(ncol, countdown(col-1, matrix[row].low), left, matrix[row][ncol])

      # checks right along a row (ncol increase)
      check(ncol, countup(col+1, matrix[row].high), right, matrix[row][ncol])

      # return the current tree object
      yield tree

proc part1(input: string): int =
  for tree in inputTrees.checkTrees:
    result += tree.visible.int

proc part2(input: string): int =
  for tree in inputTrees.checkTrees:
    result = max(result, tree.up * tree.down * tree.left * tree.right)

echo "Number of inputTrees visible from edge: ",part1(inputTrees)
echo "Highest possible scenic score: ",part2(inputTrees)
