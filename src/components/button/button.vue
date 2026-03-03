<template>
  <div>
    我是按钮
  </div>
</template>
<script>
export default {
    name: "Button"
}
</script>
<script setup>
import { sly_pkg_config } from '../../config'
console.log(sly_pkg_config.env_info)
</script>