<script setup>
import { utils } from 'sly-pkg'
</script>

<template>
    <h3>
        我是App组件
    </h3>
    <SlyButton />
    <h3>
        我是加法：1+2 = 
        {{ utils.add(1, 2) }}
    </h3>
</template>
