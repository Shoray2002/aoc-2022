local checker = require("importer")
local lines = checker.lines_from("input.txt")

local commonChars={}
for k,v in pairs(lines) do
    local first, second = v:sub(1, #v/2), v:sub(#v/2+1, #v)
    local charMaps = {}
    for i=1, #first do
        local char = first:sub(i, i)
        if charMaps[char] == nil then
            charMaps[char] = 1
        else
            charMaps[char] = charMaps[char] + 1
        end
    end
    for i=1, #second do
        local char = second:sub(i, i)
        if charMaps[char] ~= nil then
            if string.byte(char)>=97 and string.byte(char)<=122 then
                table.insert(commonChars, string.byte(char)-96)
            elseif string.byte(char)>=65 and string.byte(char)<=90 then
                table.insert(commonChars, string.byte(char)-38)
            end
            break
        end
    end
end

local sum = 0
for k,v in pairs(commonChars) do
    sum = sum + v
end
print(sum)

