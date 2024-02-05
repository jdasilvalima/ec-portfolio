<script setup>
import { onMounted } from 'vue';
import { gsap } from 'gsap';
import SplitType from 'split-type';

const props = defineProps({
  triggerSection: String,
});

let quoteText;
let quoteChars;

onMounted(() => {
  quoteText = new SplitType('.quote-text', { types: 'chars' });
  quoteChars = quoteText.chars;

  startWithScroll();
})

function startWithScroll() {
  gsap
    .timeline({
      scrollTrigger: {
        trigger: props.triggerSection,
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
}
</script>

<template>
  <div class="quote-text">
    <div class="quote-texte-char">
      <slot />
    </div>
  </div>
</template>

<style scoped>
.quote-texte-char {
  clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
}
</style>