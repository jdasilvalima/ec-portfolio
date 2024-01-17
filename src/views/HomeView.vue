<script setup lang="ts">
import Header from '@/components/Home/Header.vue';
import Introduction from '@/components/Home/Introduction.vue';
</script>

<template>
  <div class="test">
    <Header />
    <Introduction />
    <Header />
    <Header />
    <Header />
  </div>

</template>

<style scoped>
.test {
  display: flex;
  flex-direction: column;
}
</style>
