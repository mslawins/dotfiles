local luasnip = require('luasnip')

local fmt = require('luasnip.extras.fmt').fmt

local s = luasnip.s
local i = luasnip.insert_node

local it = s({ trig = 'it' }, fmt([[
    it('{}', () => {{ 
      {} 
    }}); 
  ]], { i(1, 'test_name'), i(0) }))

local describe = s('describe', fmt([[
    describe('{}', () => {{ 
      {}
    }});
  ]], { i(1, 'testcase'), i(0) }))

return { it, describe }
