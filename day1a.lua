local checker = require("importer")
local lines = checker.lines_from("input.txt")
local max=0
local sum = 0
for k,v in pairs(lines) do
    if #v ~= 0 then
        sum = sum + tonumber(v)
    else
        if sum > max then
            max = sum
        end
        sum = 0
    end
end
print(max)