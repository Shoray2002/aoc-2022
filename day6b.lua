local checker = require("importer")
local lines = checker.lines_from("input.txt")


function checkDuplicate(str)
    local len = string.len(str)
    local i = 1
    local j = 1
    local duplicate = false
    while i <= len do
        j = i + 1
        while j <= len do
            if string.sub(str, i, i) == string.sub(str, j, j) then
                duplicate = true
                break
            end
            j = j + 1
        end
        if duplicate then
            break
        end
        i = i + 1
    end
    return duplicate
end

for k,v in pairs(lines) do
    local line = v
    local sliderSize = 14
    for i=1,#line-sliderSize do
        local substr = line:sub(i,i+sliderSize-1)
        local res= checkDuplicate(substr)
        if res == false then
            print(substr, i+sliderSize-1)
            break
        end
    end
end
