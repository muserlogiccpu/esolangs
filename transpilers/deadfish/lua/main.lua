if #arg ~= 2:
    error("expected 1 argument, not " .. #arg .. ", usage: " .. arg[0] .. " <file>")
print("local acc = 0")
for i = 1, #arg[1] do
    local chr = string.sub(arg[1], i, i)
    if chr == "i" then
        print("acc + 1")
    elseif chr == "d" then
        print("acc - 1")
    elseif chr == "s" then
        print("acc ^ 2")
    elseif chr == "o" then
        print("io.write(tostring(acc))")
    end
    print("if acc == 256 or acc == -1 then acc = 0 end")
end
