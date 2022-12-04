import strutils

let pairs = readFile("input.txt").strip().splitLines()
var
  assign: seq[string]
  count = 0

# Part 01
# Split pair ranges and find out which ones are included in the other
for elf in pairs.items:
  let sections = elf.split(',')
  let (a1, a2) = (parseInt(sections[0].split('-')[0]), parseInt(sections[0].split('-')[1]))
  let (b1, b2) = (parseInt(sections[1].split('-')[0]), parseInt(sections[1].split('-')[1]))
  if (a1>b1 and a2>b2) or (a1<b1 and a2<b2):
    continue
  inc(count)

echo "Inclusion count: ",count
count = 0

# Part 02
# Find the overlapping pairs
for elf in pairs.items:
  let sections = elf.split(',')
  let (a1, a2) = (parseInt(sections[0].split('-')[0]), parseInt(sections[0].split('-')[1]))
  let (b1, b2) = (parseInt(sections[1].split('-')[0]), parseInt(sections[1].split('-')[1]))
  if (a1>b2 or b1>a2):
    continue
  inc(count)

echo "Overlapping pairs: ",count
