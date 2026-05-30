if #arg ~= 2:
    error("expected 2 arguments, not " .. #arg .. ", usage: " .. arg[0] .. " <file> <input>")
end
local code = arg[0]
local input = arg[1]
local tape = setmetatable({}, {__index = function() return 0 end})
local ptr = 0
local pc = 1
local input_ptr = 1
local output = ""
local jumps = {}
local stack = {}
for i = 1, #code do
    local char = code:sub(i, i)
    if char == "[" then
        table.insert(stack, i)
    elseif char == "]" then
        local start = table.remove(stack)
        jumps[start] = i
        jumps[i] = start
    end
end
while pc <= #code do
    local char = code:sub(pc, pc)
    if char == ">" then ptr = ptr + 1
    elseif char == "<" then ptr = ptr - 1
    elseif char == "+" then tape[ptr] = (tape[ptr] + 1) % 256
    elseif char == "-" then tape[ptr] = (tape[ptr] - 1) % 256
    elseif char == "." then output = output .. string.char(tape[ptr])
    elseif char == "," then 
        tape[ptr] = string.byte(input:sub(input_ptr, input_ptr)) or 0
        input_ptr = input_ptr + 1
    elseif char == "[" then
        if tape[ptr] == 0 then pc = jumps[pc] end
    elseif char == "]" then
        if tape[ptr] ~= 0 then pc = jumps[pc] end
    end
    pc = pc + 1
end
print(output)
