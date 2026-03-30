import sys
if len(sys.argv) != 2:
    raise Exception(f"expected 1 arguments, got {len(sys.argv)-1}, usage: {sys.argv[0]} <file>")
print("acc=0")
for i in sys.argv[1]:
    if i == "i":
        print("acc+=1")
    elif i == "d":
        print("acc-=1")
    elif i == "s":
        print("acc*=acc")
    elif i == "o":
        print("print(acc,end='')")
    print("if acc == 256 or acc == -1: acc = 0")
