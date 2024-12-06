<script setup>

import { onMounted, ref } from "vue";
import SplitType from 'split-type';
import { gsap } from 'gsap';

const grainCanvas = ref(null);

onMounted(() => {
  let headerText = new SplitType('.header-text', { types: 'chars' });
  let headerChars = headerText.chars;

  gsap.from(
    headerChars, 
    {
      yPercent: 100,
      stagger: 0.025,
      duration: 1.5,
      ease: 'power4.out',
    }
  );
})
</script>

<template>
  <div class="header-home header-text">
    <h1 class="title header-texte-char">ERNESTO C.</h1>
    <h2 class="header-texte-char">PHOTOGRAPHER</h2>
  </div>
</template>

<style scoped>
.header-home{
  min-height: calc(100vh - 6rem);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

h1 {
  font-size: 8vw;
  line-height: 1.25;
}

h2 {
  font-size: 4vw;
  font-weight: 100;
}

.header-texte-char {
  clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
}

@media (min-width: 481px)  and (max-width: 961px)  {
  h1 {
    font-size: 12vw;
  }

  h2 {
    font-size: 7vw;
  }
}

@media (max-width: 481px)  {
  h1 {
    font-size: 12vw;
  }

  h2 {
    font-size: 7vw;
  }
}
</style>
