local checker = require("importer")
local lines = checker.lines_from("input.txt")
local mapperPlayer={
    X=1,
    Y=2,
    Z=3,
}

local score=0
function decideState( out )
    if out == 'X' then
        return "lose"
    elseif out == 'Y' then
        return "draw"
    elseif out == 'Z' then
        return "win"
    end
end
function decideMove(opp,out)
    if opp == 'A' and out == 'X' then
        return 3
    elseif opp == 'A' and out == 'Y' then
        return 1
    elseif opp == 'A' and out == 'Z' then
        return 2
    elseif opp == 'B' and out == 'X' then
        return 1
    elseif opp == 'B' and out == 'Y' then
        return 2
    elseif opp == 'B' and out == 'Z' then
        return 3
    elseif opp == 'C' and out == 'X' then
        return 2
    elseif opp == 'C' and out == 'Y' then
        return 3
    elseif opp == 'C' and out == 'Z' then
        return 1
    end
end
for k,v in pairs(lines) do
    local sum=0
    local space=string.find( v, " ")
    local opponent=string.sub(v, 1, space-1)
    local outcome=string.sub(v, space+1)
    sum=sum+decideMove(opponent,outcome)
    local state=decideState(outcome)
    if state == "win" then 
        sum=sum+6
    elseif state == "draw" then
        sum=sum+3
    end
    score=score+sum
end
print(score)