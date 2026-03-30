local module = {}
function module.main(code: str): str
    local output = ""
    output ..= "local acc = 0\n"
    output ..= "local output = ''\n"
    for i = 1, #code do
        local chr = string.sub(code, i, i)
        if chr == "i" then
            output ..= "acc += 1\n"
        elseif chr == "d" then
            output ..= "acc -= 1\n"
        elseif chr == "s" then
            output ..= "acc ^= 2\n"
        elseif chr == "o" then
            output ..= "output ..= acc\n"
        end
        output ..= "if acc == 256 or acc == -1 then acc = 0 end\n"
    end
    output ..= "print(output)\n"
    return output
end
return module
