local luasnip = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local s = luasnip.s
local i = luasnip.insert_node

local solid_component = s({ trig = '-solid-component' }, fmt([[
    import type {{ Component }} from 'solid-js';

    const {}: Component = () => {{
      return <p>placeholder</p>;
    }};

    export default {};
]], { i(1), rep(1) }))

return { solid_component }
