local checker = require("importer")
local lines = checker.lines_from("input.txt")
local mapperPlayer={
    X=1,
    Y=2,
    Z=3,
}

local score=0
function decideState( opp, my )
    if opp == 'A' and my == 'X' then
        return "draw"
    elseif opp == 'A' and my == 'Y' then
        return "win"
    elseif opp == 'A' and my == 'Z' then
        return "lose"
    elseif opp == 'B' and my == 'X' then
        return "lose"
    elseif opp == 'B' and my == 'Y' then
        return "draw"
    elseif opp == 'B' and my == 'Z' then
        return "win"
    elseif opp == 'C' and my == 'X' then
        return "win"
    elseif opp == 'C' and my == 'Y' then
        return "lose"
    elseif opp == 'C' and my == 'Z' then
        return "draw"
    end
end

for k,v in pairs(lines) do
    local sum=0
    local space=string.find( v, " ")
    local opponent=string.sub(v, 1, space-1)
    local player=string.sub(v, space+1)
    if player == "X" then
        sum=sum+mapperPlayer.X
    elseif player == "Y" then
        sum=sum+mapperPlayer.Y
    elseif player == "Z" then
        sum=sum+mapperPlayer.Z
    end
    local state=decideState(opponent, player)
    if state == "win" then 
        sum=sum+6
    elseif state == "draw" then
        sum=sum+3
    end
    score=score+sum
end
print(score)