local checker = require("importer")
local lines = checker.lines_from("input.txt")
local total={}
local sum = 0
table.insert( lines, #lines+1, "" )
for k,v in pairs(lines) do
    if #v ~= 0 then
        sum = sum + tonumber(v)
    elseif #v == 0 then
        table.insert(total, sum)
        sum = 0
    end
end
table.sort(total, function(a,b) return a > b end)
print(total[1] + total[2] + total[3])