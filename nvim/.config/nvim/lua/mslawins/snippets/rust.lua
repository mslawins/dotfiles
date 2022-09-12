local luasnip = require('luasnip')

local fmt = require('luasnip.extras.fmt').fmt

local s = luasnip.s
local i = luasnip.insert_node

local test = s({ trig = '-test' }, fmt([[
    #[test] 
    fn {}() {{ 
      {} 
    }} 
  ]], { i(1, 'test_name'), i(0) }))

local modtest = s('-modtest', fmt([[
    #[cfg(test)]
    mod test {{
      use super::*;

      {}
    }}
  ]], i(0)))

return { test, modtest }
