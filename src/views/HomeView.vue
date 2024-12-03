<script setup lang="ts">
import Header from '@/components/Home/MainHeader.vue';
import Introduction from '@/components/Home/Introduction.vue';
import SmallGallery from '@/components/Home/SmallGallery.vue';
import Footer from '@/components/Footer.vue';
import ImageWaveEffect from '@/components/Home/ImageWaveEffect.vue';
</script>

<template>
  <div class="home">
    <Header />
    <!-- <ImageWaveEffect /> -->
    <Introduction />
    <SmallGallery />
    <Footer />
  </div>

</template>

<style scoped>
.home {
  display: flex;
  flex-direction: column;
}
</style>
