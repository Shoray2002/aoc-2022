local checker = require("importer")
local lines = checker.lines_from("input.txt")

local indexLine
local numberOfStacks 
local stacks = {}

function fixString(string)
    local temp 
    temp=  string.gsub(string, "] %[", "")
    temp = string.gsub(temp, "    ", "0")
    temp=string.gsub(temp, "%[", "")
    temp=string.gsub(temp, "%]", "")
    temp=string.gsub(temp, " ", "")
    return temp
end

for k,v in pairs(lines) do
    if string.find(v, "1") then
        indexLine = k
        v = string.gsub(v, " ", "")
        numberOfStacks = string.len( v )
        for i=1, numberOfStacks do
            stacks[i] = {}
        end
        break
    end
end

for i=1, indexLine-1 do
    local temp = fixString(lines[i])
    for j=1, numberOfStacks do
        if string.sub(temp, j, j) == "0" then goto continue  end
    table.insert(stacks[j],1, string.sub(temp, j, j))
    ::continue::    
    end
end

for i=indexLine+2,#lines  do
    local spacesEncountered = 0
    local firstSpace,secondSpace,thirdSpace,fourthSpace,fifthSpace
    for j=1,#lines[i] do
        local pointer=string.sub(lines[i], j, j)
        if pointer == " " then
            spacesEncountered = spacesEncountered + 1
            if spacesEncountered == 1 then
                firstSpace = j
            elseif spacesEncountered == 2 then
                secondSpace = j
            elseif spacesEncountered == 3 then
                thirdSpace = j
            elseif spacesEncountered == 4 then
                fourthSpace = j
            elseif spacesEncountered == 5 then
                fifthSpace = j
            end
        end
    end
    local numberToMove= tonumber(string.sub(lines[i], firstSpace+1, secondSpace-1))
    local fromCrate= tonumber(string.sub(lines[i], thirdSpace+1, fourthSpace-1))
    local toCrate= tonumber(string.sub(lines[i], fifthSpace+1, #lines[i]))
    local stack = {}
    for j=1, numberToMove do
        table.insert( stack,1, stacks[fromCrate][#stacks[fromCrate]] )
        table.remove(stacks[fromCrate], #stacks[fromCrate])
    end
    for j=1, numberToMove do
        table.insert(stacks[toCrate], stack[#stack])
        table.remove(stack, #stack)
    end
end

local resultString = ""
for k,v in pairs(stacks) do
    resultString = resultString ..v[#v]
end
print(resultString)
