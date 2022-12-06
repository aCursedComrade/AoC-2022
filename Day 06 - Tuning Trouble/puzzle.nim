import strutils, sequtils

let datastream = readFile("input.txt").strip()

# Part 01
for i in countup(0, datastream.len - 3):
  let buff = deduplicate(datastream[i .. i+3])
  if buff.len == 4:
    echo "Start of packet: ",i+4
    break

# Part 02
for i in countup(0, datastream.len - 13):
  let buff = deduplicate(datastream[i .. i+13])
  if buff.len == 14:
    echo "Start of message: ",i+14
    break
