<script setup lang="ts">
import Header from '@/components/Home/MainHeader.vue';
import Introduction from '@/components/Home/QuoteIntroduction.vue';
import SmallGallery from '@/components/Home/SmallGallery.vue';
import Footer from '@/components/MainFooter.vue';
import MouseCircle from '@/components/Home/MouseCircle.vue';
import ImageWaveEffect from '@/components/Home/ImageWaveEffect.vue';
import ShaderBackground from '@/components/Home/ShaderBackground.vue';
</script>

<template>
  <div>
    <MouseCircle class="mouse-circle"/>
    <ShaderBackground />
    <div class="home">
      <Header />
      <!-- <ImageWaveEffect /> -->
      <Introduction />
      <SmallGallery />
      <Footer />
    </div>
  </div>

</template>

<style scoped>
.home {
  display: flex;
  flex-direction: column;
  align-items: center; 
  max-width: 1100px;
  margin: 0 auto;
  padding: 0 2rem;
}

.mouse-circle {
  display: block;
}

@media (max-width: 1024px) {
  .mouse-circle {
    display: none;
  }
}

</style>
