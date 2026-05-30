local module = {}
function module.main(code: str, input: str): str
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
        if char == ">" then ptr += 1
        elseif char == "<" then ptr -= 1
        elseif char == "+" then tape[ptr] = (tape[ptr] + 1) % 256
        elseif char == "-" then tape[ptr] = (tape[ptr] - 1) % 256
        elseif char == "." then output ..= string.char(tape[ptr])
        elseif char == "," then 
            tape[ptr] = string.byte(input:sub(input_ptr, input_ptr)) or 0
            input_ptr += 1
        elseif char == "[" then
            if tape[ptr] == 0 then pc = jumps[pc] end
        elseif char == "]" then
            if tape[ptr] ~= 0 then pc = jumps[pc] end
        end
        pc += 1
    end
    return output
end
return module
