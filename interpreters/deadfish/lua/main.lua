if #arg ~= 2:
    error("expected 1 argument, not " .. #arg .. ", usage: " .. arg[0] .. " <file>")
  local acc = 0
  for i = 1, #arg[1] do
    local chr = string.sub(arg[1], i, i)
    if chr == "i" then
      acc = acc + 1
    elseif chr == "d" then
      acc = acc -1 
    elseif chr == "s" then
      acc = acc ^ 2
    elseif chr == "o" then
      io.write(tostring(acc)
    end
    if acc == 256 or acc == -1 then acc = 0 end
  end
