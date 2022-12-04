local checker = require("importer")
local lines = checker.lines_from("input.txt")
local sum = 0

function convertRangetoNumber(range)
    local min = tonumber(range:sub(1, range:find("-")-1))
    local max = tonumber(range:sub(range:find("-")+1))
    return min, max
end

function checkFirstInSecond(first, second)
    local firstMin, firstMax = convertRangetoNumber(first)
    local secondMin, secondMax = convertRangetoNumber(second)
    if firstMin>= secondMin and firstMax <= secondMax then
        return true
    end
    return false
end

function checkSecondInFirst(first, second)
    local firstMin, firstMax = convertRangetoNumber(first)
    local secondMin, secondMax = convertRangetoNumber(second)
    if secondMin>= firstMin and secondMax <= firstMax then
        return true
    end
    return false
end


for k,v in pairs(lines) do
    local comma = string.find(v, ",")
    local first = string.sub(v, 1, comma-1)
    local second = string.sub(v, comma+1)
    local res1, res2 = checkFirstInSecond(first, second), checkSecondInFirst(first, second)
    if res1 and res2 then
        sum = sum + 1
    elseif res1 or res2 then
        sum = sum + 1
    end
end

print(sum)

