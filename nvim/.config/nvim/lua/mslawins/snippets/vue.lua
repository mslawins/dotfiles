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

  <style scoped>
  </style>
]], {}))

local define_emits = s({ trig = '-v-define-emits'}, fmt([[
  interface {} {{
    (e: '{}',): void;
  }}

  const emit = defineEmits<{}>();
]], {i(1), i(2), rep(1)}))

return { component, define_emits }
