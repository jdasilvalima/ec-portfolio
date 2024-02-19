<script setup>
import Lenis from "@studio-freight/lenis";
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { onMounted } from 'vue';
import { RouterLink, RouterView } from 'vue-router';
import Navbar from '@/components/Navbar.vue';
import Cursor from '@/components/Cursor.vue';

// Text showing > text showing when on screen + come back
// Grid > ok + verify responsive
// text size and font
// Gallery Grid
// Image effect
// https://tympanus.net/codrops/2020/03/17/create-a-wave-motion-effect-on-an-image-with-three-js/
// https://tympanus.net/codrops/2020/04/14/interactive-webgl-hover-effects/
// Mouse
// Footer > need to add link
// Header webGl

onMounted(() => {
  scrollAnimation();
});

function scrollAnimation() {
  const lenis = new Lenis({
    duration: 1,
    easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
    smooth: true
  })

  function raf(time) {
    lenis.raf(time)
    requestAnimationFrame(raf)
  }

  requestAnimationFrame(raf)

  gsap.registerPlugin(ScrollTrigger);
};

</script>

<template>
  <div id="wrapper">
    <Navbar/>
    <!-- <Cursor/> -->
    <RouterView />
  </div>
</template>

<style scoped>
</style>
