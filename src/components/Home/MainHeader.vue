<script setup>
import ShaderBackground from '@/components/Home/ShaderBackground.vue';
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

  <ShaderBackground />

</template>

<style scoped>
.header-home{
  min-height: 70vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-bottom: 13rem;
}

h1 {
  font-size: 9vw;
  line-height: 1.25;
}

h2 {
  font-size: 5vw;
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

  .header-home{
    min-height: 80vh;
    margin-bottom: 5rem;
  }
}

@media (max-width: 481px)  {
  h1 {
    font-size: 12vw;
  }

  h2 {
    font-size: 7vw;
  }

  .header-home{
    min-height: 80vh;
    margin-bottom: 3rem;
  }
}

/*css morphing*/
.background {
  position: relative;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  background: linear-gradient(120deg, #f08d49, #ffb77a, #8bc6ec, #4bacc6);
  background-size: 400% 400%;
  animation: gradient-shift 8s ease infinite;
}
</style>
