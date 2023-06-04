local G = require('G')
local M = {}
local leap = require('leap')
function M.config()
    leap.add_default_mappings()
end

function M.setup()
    -- do nothing
end

return M


