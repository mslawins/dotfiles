local luasnip = require('luasnip')

local fmt = require('luasnip.extras.fmt').fmt

local s = luasnip.s
local i = luasnip.insert_node
local t = luasnip.text_node
local c = luasnip.choice_node

local single_test = s({ trig = 'test' }, fmt([[
    #[test] 
    fn {}() {} {{ 
      {} 
    }} 
  ]], { i(1, 'test_name'), c(2, { t '', t ' -> Result<()> ' }), i(0) }))

local mod_test = s('modtest', fmt([[
    #[cfg(test)]
    mod test {{
      use super::*;

      {}
    }}
  ]], i(0)))

return { single_test, mod_test }
