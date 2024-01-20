<script setup lang="ts">
import Header from '@/components/Home/Header.vue';
import Introduction from '@/components/Home/Introduction.vue';
import SmallGallery from '@/components/Home/SmallGallery.vue';
</script>

<template>
  <div class="test">
    <Header />
    <Introduction />
    <SmallGallery />
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
