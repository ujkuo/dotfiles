require('craftzdog.base')
require('craftzdog.highlights')
require('craftzdog.maps')
require('craftzdog.plugins')
require('craftzdog.abbre')
require('craftzdog.skeleton')

local has = function(x)
      return vim.fn.has(x) == 1
  end
  local is_mac = has "macunix"
  local is_win = has "win32"

  if is_mac then
        require('craftzdog.macos')
    end
    if is_win then
          require('craftzdog.windows')
      end
