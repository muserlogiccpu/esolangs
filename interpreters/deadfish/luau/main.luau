local module = {}
function module.main(code: str): str
    local output = ""
    local acc = 0
    for i = 1, #code do
        local chr = string.sub(code, i, i)
        if chr == "i" then
            acc += 1
        elseif chr == "d" then
            acc -= 1
        elseif chr == "s" then
            acc ^= 2
        elseif chr == "o" then
           output ..=acc
        end
        if acc == 256 or acc == -1 then acc = 0 end
    end
    return output
end
return module
