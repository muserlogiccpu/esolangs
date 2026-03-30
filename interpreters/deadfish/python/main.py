import sys
if len(sys.argv) != 2:
  raise Exception(f"usage: {sys.argv[0]} <file")
acc = 0
for i in sys.argv[1]:
  if i == "i":
    acc+=1
  if i == "d":
    acc-=1
  if i == "s":
    acc=acc**2
  if i == "o":
    print(acc,end='')
  if acc == 256 or acc == -1:
    acc = 0
