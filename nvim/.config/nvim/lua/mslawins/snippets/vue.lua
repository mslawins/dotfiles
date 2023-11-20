local luasnip = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local s = luasnip.s
local i = luasnip.insert_node

local component = s({ trig = '-v-component' }, fmt([[
  <script setup lang="ts">
  </script>

  <template>
  </template>

  <style scoped lang="scss">
  </style>
]], {}))

local define_emits = s({ trig = '-v-define-emits' }, fmt([[
  interface {} {{
    (eventName: '{}',): void;
  }}

  const emit = defineEmits<{}>();
]], { i(1), i(2), rep(1) }))

local ref_log = s({ trig = '-v-ref-log' }, fmt([[
  JSON.parse(JSON.stringify({})),
]], { i(1) }));

return { component, define_emits, ref_log }
