local checker = require("importer")
local lines = checker.lines_from("input.txt")
for k,v in pairs(lines) do
    print(v)
end