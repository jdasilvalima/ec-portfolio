<script setup>
import { onMounted } from 'vue';
import { gsap } from 'gsap';
import SplitType from 'split-type';

onMounted(() => {
  const quoteText = new SplitType('.quote-text', { types: 'chars' });
  const quoteChars = quoteText.chars;

  gsap.fromTo(
    quoteChars,
    { 
      y: 100,
      opacity: 0
    },
    {
      y: 0,
      opacity: 1,
      stagger: 0.05,
      duration: 2,
      ease: 'power4.out',
    }
  )
});

</script>

<template>
  <div class="about-section">
    <div class="quote-text">
      <span class="quote-texte-char">Capture the whispers of doubt with your <strong><em>lens</em></strong>,</span>
      <br/>
      <span class="quote-texte-char">turning them into <strong><em>silent</em></strong> applause</span>
      <br/>
      <span class="quote-texte-char">for your <strong><em>artistic spirit</em></strong></span>
    </div>
  </div>
</template>

<style scoped>
.about-section {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
.quote-text {
  text-align: center;
  font-size: 2rem;
  line-height: 1.5;
}

.quote-texte-char {
  clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
}
</style>