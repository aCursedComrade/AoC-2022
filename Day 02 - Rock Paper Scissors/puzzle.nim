import strutils

let
  rounds = readFile("strategy.txt").splitLines()
  x = 1
  y = 2
  z = 3
var total = 0

# Part 01
# function to evaluate a round and return the score
proc evalRoundV1(round: string): int =
  let cmp = round.toLowerAscii()
  case cmp
  of "a x", "b y", "c z": #draws
    if (cmp[^1] == 'x'): result = 3 + x
    elif (cmp[^1] == 'y'): result = 3 + y
    else: result = 3 + z
  of "a y", "b z", "c x":
    if (cmp[^1] == 'x'): result = 6 + x
    elif (cmp[^1] == 'y'): result = 6 + y
    else: result = 6 + z
  else:
    if (cmp[^1] == 'x'): result = x
    elif (cmp[^1] == 'y'): result = y
    else: result = z

for play in rounds.items:
  total = total + evalRoundV1(play)

echo "Total score (part 1): ", total

# Part 02
total = 0
proc evalRoundV2(round: string): int =
  let cmp = round.toLowerAscii()
  case cmp
  of "a y", "b y", "c y": #draws
    if (cmp[0] == 'a'): result = 3 + x
    elif (cmp[0] == 'b'): result = 3 + y
    else: result = 3 + z
  of "a z", "b z", "c z":
    if (cmp[0] == 'a'): result = 6 + y
    elif (cmp[0] == 'b'): result = 6 + z
    else: result = 6 + x
  else:
    if (cmp[0] == 'a'): result = z
    elif (cmp[0] == 'b'): result = x
    else: result = y

for play in rounds.items:
  total = total + evalRoundV2(play)

echo "Total score (part 2): ", total
