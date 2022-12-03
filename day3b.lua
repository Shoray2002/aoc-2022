local checker = require("importer")
local lines = checker.lines_from("input.txt")
local commonChars={}
local charPriorities={}
for i=1, #lines,3 do
    local line1, line2, line3 = lines[i], lines[i+1], lines[i+2]
    local hash1 = {}
    for i=1,#line1 do
        local char = line1:sub(i,i)
        hash1[char] = (hash1[char] or 0) + 1
    end
    local hash2 = {}
    for i=1,#line2 do
        local char = line2:sub(i,i)
        hash2[char] = (hash2[char] or 0) + 1
    end
    local hash3 = {}
    for i=1,#line3 do
        local char = line3:sub(i,i)
        hash3[char] = (hash3[char] or 0) + 1
    end
    for char, count in pairs(hash1) do
        if hash2[char] and hash3[char] then
            commonChars[char] = (commonChars[char] or 0) + 1
        end
    end
end
for k,v in pairs(commonChars) do
    if string.byte(k)>=97 and string.byte(k)<=122 then
        table.insert(charPriorities, (string.byte(k)-96)*v)
    elseif string.byte(k)>=65 and string.byte(k)<=90 then
        table.insert(charPriorities, (string.byte(k)-38)*v)
    end
end

local sum = 0
for k,v in pairs(charPriorities) do
    sum = sum + v
end
print(sum)

