<script setup>
import { onMounted } from 'vue';
import SplitType from 'split-type';
import { gsap } from 'gsap';

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
  min-height: 70vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-bottom: 10rem;
}

h1 {
  font-size: 10vw;
  line-height: 1.25;
}

h2 {
  font-size: 6vw;
  font-weight: 100;
}

.header-texte-char {
  clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
}

@media (min-width: 900px)  {
  h1 {
    font-size: 7vw;
  }

  h2 {
    font-size: 3.6vw;
  }
}
</style>
