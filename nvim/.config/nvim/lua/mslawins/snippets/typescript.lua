local luasnip = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local s = luasnip.s
local i = luasnip.insert_node

local it = s({ trig = '-it' }, fmt([[
    it('{}', () => {{
      {}
    }});
]], { i(1, 'test_name'), i(0) }))

local test_content = s({ trig = '-test-content' }, fmt([[
    const expected = null;
    const result = {}
    expect(result).toEqual(expected);
]], { i(1) }))

local describe = s('-describe', fmt([[
    describe('{}', () => {{
      {}
    }});
]], { i(1, 'testcase'), i(0) }))

local ng_component = s({ trig = '-ng-component' }, fmt([[
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

local pinia_store = s({ trig = '-pinia-store' }, fmt([[
    import {{ ref }} from 'vue';
    import {{ defineStore }} from 'pinia';

    export const use{}Store = defineStore('{}', () => {{
      return {{}};
    }});
]], { i(1), i(2) }))

return { it, describe, ng_component, pinia_store, test_content }
