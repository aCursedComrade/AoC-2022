import strutils

let terminal = readFile("input.txt").strip()

# Part 01
# returns total size of files in each dir
# final item is the total file system size
proc getSizes(input: string): seq[int] =
  var dirtree = @[0]

  template prev() =
    dirtree[^2] += dirtree[^1]
    result.add(dirtree.pop)
  
  for line in input.splitLines:
    if line.startsWith("$ cd"):
      if line.endsWith("/"):
        #echo "[CD] Moving to root"
        while dirtree.len > 1:
          prev
      elif line.endsWith(".."):
        #echo "[CD] Moving to previous"
        prev
      else:
        #echo "[DIR] Moving: ", line
        dirtree.add(0)
    elif line.find({'0'..'9'}) == 0:
      #echo "[F] Found a file: ",line
      dirtree[^1] += line.split[0].parseInt
  while dirtree.len > 1:
    prev
  result.add(dirtree[0])

#echo "Sizes: ",terminal.getSizes
var total = 0
for dsize in terminal.getSizes:
  if dsize <= 100000:
    total += dsize

echo "Total size of dirs (<= 100000): ",total

# Part 2
let totalUsed = terminal.getSizes[^1]
let free = 70_000_000 - totalUsed
let need = 30_000_000 - free
var candidates: seq[int]
for dsize in terminal.getSizes:
  if dsize > need:
    candidates.add(dsize)

echo "Size of dir to be deleted: ",candidates.min
