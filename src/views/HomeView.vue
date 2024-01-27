<script setup lang="ts">
import Header from '@/components/Home/Header.vue';
import Introduction from '@/components/Home/Introduction.vue';
import SmallGallery from '@/components/Home/SmallGallery.vue';
import Footer from '@/components/Footer.vue';
import ImageWaveEffect from '@/components/Home/ImageWaveEffect.vue';
</script>

<template>
  <div class="test">
    <ImageWaveEffect />
    <!-- <Header />
    <Introduction />
    <SmallGallery />
    <Footer /> -->
  </div>

</template>

<style scoped>
.test {
  display: flex;
  flex-direction: column;
}
</style>
