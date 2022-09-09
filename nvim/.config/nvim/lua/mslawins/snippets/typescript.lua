local luasnip = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

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

local component = s({ trig = 'component' }, fmt([[
    import {{ ChangeDetectionStrategy, Component }} from '@angular/core';

    @Component({{
      selector: '{}',
      templateUrl: '{}.component.html',
      changeDetection: ChangeDetectionStrategy.OnPush,
    }})
    export class {}Component {{
      {}
    }}
]], { i(1), rep(1), i(2), i(0) }))

return { it, describe, component }
