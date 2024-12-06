<script setup>
import { onMounted } from 'vue';
import { gsap } from 'gsap';
import SplitType from 'split-type';

onMounted(() => {
  const quoteText = new SplitType('.quote-text', { types: 'chars' });
  const quoteChars = quoteText.chars;

  gsap
    .timeline({
      scrollTrigger: {
        trigger: '.about-section',
        start: 'top center',
        end: 'top center',
        //markers: true,
      },
    })
    .from(
      quoteChars,
      {
        yPercent: 100,
        stagger: 0.025,
        duration: 0.6,
        ease: 'power4.out',
      },
    )
})

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
  margin-bottom: 15rem;
}

.quote-text {
  text-align: center;
  font-size: 2.5vw;
  line-height: 1.5;
}

.quote-texte-char {
  clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
}

@media (min-width: 481px)  and (max-width: 961px)  {
  .quote-text {
    font-size: 3.5vw;
    line-height: 1.5;
  }
}

@media (max-width: 481px)  {
  .quote-text {
    font-size: 4.2vw;
    line-height: 2;
  }
}
</style>