local luasnip = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

local s = luasnip.s

local component = s({ trig = '-v-component' }, fmt([[
  <script setup lang="ts">
  </script>

  <template>
  </template>

  <style scoped>
  </style>
]], {}))

return { component }
