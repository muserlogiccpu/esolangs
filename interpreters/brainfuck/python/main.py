import sys
if len(sys.argv) < 2 or len(sys.argv) > 3:
    raise Exception(f"expected 2 arguments, got {len(sys.argv)-1}, usage: {sys.argv[0]} <file> <input>")
print("acc=0")
mem = [0]*30000
ptr = 0
output = ""
inpu = sys.argv[2]
code = sys.argv[1]
stack = []
dicti = {}
for e,i in enumerate(code):
  if i=="]":
    if not stack:
      raise SyntaxError("closing bracket without matching opening, pos: " + str(e))
    dicti[stack[-1]]=e
    dicti[e]=stack[-1]
    stack.pop()
  if i=="[":
    stack.append(e)
if stack:
  raise SyntaxError("opening bracket without matching closing, pos: " + str(stack[-1]))
i=0
inptr=0
while i<len(code):
  chra = code[i]
  if chra=="+":
    mem[ptr]=(mem[ptr]+1)%256
  elif chra=="-":
    mem[ptr]=(mem[ptr]-1)%256
  elif chra==">":
    ptr = (ptr + 1)%30000
  elif chra=="<":
    ptr = (ptr - 1)%30000
  elif chra==".":
    print(chr(mem[ptr]),end='')
  elif chra==",":
    if inptr < len(inpu):
      mem[ptr]=ord(inpu[inptr])%256
      inptr+=1
    else:
      mem[ptr]=0
  elif chra=="[":
    if mem[ptr]==0:
      i=dicti[i]
      continue
  elif chra=="]":
    if mem[ptr]!=0:
      i=dicti[i]
      continue
  i+=1
  
