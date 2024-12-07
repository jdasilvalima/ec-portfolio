<script setup lang="ts">
import Header from '@/components/Home/MainHeader.vue';
import Introduction from '@/components/Home/QuoteIntroduction.vue';
import SmallGallery from '@/components/Home/SmallGallery.vue';
import Footer from '@/components/MainFooter.vue';
import MouseCircle from '@/components/Home/MouseCircle.vue';
import ImageDistortion from '@/components/Home/ImageDistortion.vue';
import ShaderBackground from '@/components/Home/ShaderBackground.vue';
</script>

<template>
  <div>
    <div class="desk-effect">
      <MouseCircle/>
      <ShaderBackground />
    </div>
    <div class="home">
      <Header />
      <!-- <ImageDistortion/> -->
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

.desk-effect {
  display: block;
}

@media (max-width: 1020px) {
  .desk-effect {
    display: none;
  }
}

</style>
