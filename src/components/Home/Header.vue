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
  
  <div class="background">
    <div class="bg-shape1 shape"></div>
    <div class="bg-shape2 shape"></div>
    <div class="bg-shape3 shape"></div>
  </div>
  

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
  display: inline-flex;
  flex-direction: row;
  justify-content: center;
  position: absolute;
  z-index: -1;
}

.bg-shape1 {
  width: 400px;
  height: 400px;
  border-radius: 9999px;
  position: relative;
  animation: one 10s infinite;
  background-color: #29ADB2;
}


.bg-shape2 {
  width: 300px;
  height: 300px;
  border-radius: 9999px;
  position: relative;
  animation: two 10s infinite;
  background-color: #C5E898;
}

.bg-shape3 {
  width: 400px;
  height: 400px;
  border-radius: 9999px;
  position: relative;
  animation: three 10s infinite;
  background-color: #0766AD;
}
.shape {
  opacity: .5;
  filter: blur(90px);
}

@keyframes one {
  0% { left: 0px; top: 0px }
  25% { left: -100px; top: 70px }
  50% { left: 20px; top: 150px }
  75% { left: 50px; top: 100px }
  100% { left: 0px; top: 0px }
}

@keyframes two {
  0% { left: 0px; top: 0px }
  25% { left: 50px; top: 10px }
  50% { left: 100px; top: 50px }
  75% { left: 50px; top: 100px }
  100% { left: 0px; top: 0px }
}

@keyframes three {
  0% { left: -20px; top: 0px }
  25% { left: 15px; top: 30px }
  50% { left: 35px; top: 75px }
  75% { left: 50px; top: 150px }
  100% { left: -20px; top: 0px }
}
</style>
