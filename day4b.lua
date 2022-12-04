local checker = require("importer")
local lines = checker.lines_from("input.txt")
local sum = 0

function convertRangetoNumber(range)
    local min = tonumber(range:sub(1, range:find("-")-1))
    local max = tonumber(range:sub(range:find("-")+1))
    return min, max
end

function check(first, second)
    local firstMin, firstMax = convertRangetoNumber(first)
    local secondMin, secondMax = convertRangetoNumber(second)
    if secondMin <= firstMax and firstMin <= secondMax then
        sum = sum + 1
    end
end


for k,v in pairs(lines) do
    local comma = string.find(v, ",")
    local first = string.sub(v, 1, comma-1)
    local second = string.sub(v, comma+1)
    check(first, second)
end

print(sum)

