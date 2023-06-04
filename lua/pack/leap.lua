local G = require('G')
local M = {}
local leap = require('leap')
function M.config()
    leap.add_default_mappings()
    require('flit').setup {
      keys = { f = 'f', F = 'F', t = 't', T = 'T' },
      -- A string like "nv", "nvo", "o", etc.
      labeled_modes = "v",
      multiline = true,
      -- Like `leap`s similar argument (call-specific overrides).
      -- E.g.: opts = { equivalence_classes = {} }
      opts = {}
}
end

function M.setup()
    -- do nothing
end

return M


