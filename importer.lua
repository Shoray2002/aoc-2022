local fileChecker={}
local file = 'input.txt'

function fileChecker.file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

function fileChecker.lines_from(file)
    if not fileChecker.file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do 
        lines[#lines + 1] = line
    end
    return lines
end
return fileChecker