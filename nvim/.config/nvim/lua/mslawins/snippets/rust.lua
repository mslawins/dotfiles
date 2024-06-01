local luasnip = require('luasnip')

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local s = luasnip.s
local i = luasnip.insert_node

local test = s({ trig = '-test' }, fmt([[
    #[test]
    fn {}() {{
      {}
    }}
  ]], { i(1, 'test_name'), i(0) }))

local modtest = s({ trig = '-modtest' }, fmt([[
    #[cfg(test)]
    mod test {{
      use super::*;

      {}
    }}
  ]], i(0)))

local bevy_plugin = s({ trig = '-bevy_plugin' }, fmt([[
    pub struct {};

    impl Plugin for {} {{
        fn build(&self, app: &mut App) {{
          {}
        }}
    }}
]], { i(1, 'PluginName'), rep(1), i(0) }))

return { test, modtest, bevy_plugin }
