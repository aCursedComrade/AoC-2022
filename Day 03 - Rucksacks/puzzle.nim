import strutils, sequtils, sets

let content = readFile("input.txt").splitLines()
var total = 0

# Part 01
for val in content.items:
  let mid = toInt(len(val)/2)
  let c1 = toHashSet(val[0..<mid])
  let c2 = toHashSet(val[mid..^1])
  let cm = join(toSeq(c1 * c2), "")
  if (ord(cm[0]) >= 97):
    total = total + (ord(cm[0]) - 96)
  else:
    total = total + (ord(cm[0]) - 38)

echo "Total of common items: ",total
#echo ord('a') # 96 offset
#echo ord('A') # 38 offset
total = 0

# Part 02
for val in countup(0, high(content), 3):
  let g1 = toHashSet(content[val])
  let g2 = toHashSet(content[val+1])
  let g3 = toHashSet(content[val+2])
  let badge = join(toSeq(g1 * g2 * g3), "")
  if (ord(badge[0]) >= 97):
    total = total + (ord(badge[0]) - 96)
  else:
    total = total + (ord(badge[0]) - 38)

echo "Total of badges: ",total
