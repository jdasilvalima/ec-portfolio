<script setup>
import { onMounted } from 'vue';
import SplitType from 'split-type';
import { gsap } from 'gsap';

onMounted(() => {
  let galleryText = new SplitType('.gallery-text', { types: 'chars' });
  let galleryChars = galleryText.chars;

  gsap
    .timeline({
      scrollTrigger: {
        trigger: '.small-gallery',
        start: 'top 75%',
        end: 'top 75%',
        //markers: true,
      },
    })
    .from(
      galleryChars,
      {
        yPercent: 100,
        stagger: 0.025,
        duration: 1.5,
        ease: 'power4.out',
      },
    )
})
</script>

<template>
  <div class="small-gallery">
    <div class="small-gallery-presentation gallery-text">
      <span class="title title-pictures gallery-text-char">MY PICTURES</span>
      <span class="subtitle gallery-text-char">Landscape / Portrait</span>
      <span class="subtitle gallery-text-char">/ Architecture</span>
    </div>
    <img class="image-1" src="@/assets/img/ec/1.jpg" alt="image gallery 1"/>
    <img class="image-2" src="@/assets/img/ec/2.jpg" alt="image gallery 2"/>
    <img class="image-3" src="@/assets/img/ec/3.jpg" alt="image gallery 3"/>
    <img class="image-4" src="@/assets/img/ec/4.jpg" alt="image gallery 4"/>
    <img class="image-5" src="@/assets/img/ec/5.jpg" alt="image gallery 5"/>
    <img class="image-6" src="@/assets/img/ec/6.jpg" alt="image gallery 6"/>
    <img class="image-7" src="@/assets/img/ec/7.jpg" alt="image gallery 7"/>
    <img class="image-8" src="@/assets/img/ec/8.jpg" alt="image gallery 8"/>
    <img class="image-9" src="@/assets/img/ec/9.jpg" alt="image gallery 9"/>
    <img class="image-10" src="@/assets/img/ec/10.jpg" alt="image gallery 10"/>
    <img class="image-11" src="@/assets/img/ec/11.jpg" alt="image gallery 11"/>
    <img class="image-12" src="@/assets/img/ec/12.jpg" alt="image gallery 12"/>
  </div>
</template>

<style scoped>

.small-gallery {
  display: grid;
  grid-template-columns: 1fr;
  row-gap: 15px;
  margin: 5rem 0rem;
}

.small-gallery-presentation {
  display: flex;
  flex-direction: column;
}

img {
  width: 100%;
  height: auto;
}

.title-pictures {
  font-size: 3.5vw;
  font-weight: 600;
  margin-bottom: 1rem;
}

.subtitle {
  font-size: 7vw;
  font-weight: 100;
  margin-bottom: 1rem;
}

/* .separator {
  width: 20%;
  height: 2px;
  background-color: black;
} */

.gallery-text-char {
  clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
}

@media (min-width: 481px)  and (max-width: 961px)  {
  .title-pictures {
    font-size: 2vw;
  }

  .subtitle {
    font-size: 4vw;
  }
}

@media (min-width: 961px) {
  .title-pictures {
    font-size: 1.2vw;
  }

  .subtitle {
    font-size: 2.8vw;
  }

  .small-gallery {
    display: grid;
    grid-template-columns: repeat(11,1fr);
    grid-template-rows: auto;
    row-gap: 0px;
    z-index: 1;
  }
  
  .small-gallery-presentation {
    grid-column-start: 7;
    grid-column-end: 12;
  }
  
  .image-1 {
    grid-column-start: 1;
    grid-column-end: 6;
    grid-row-start: 1;
    grid-row-end: 2;
    z-index: 2;
  }
  
  .image-2 {
    grid-column-start: 5;
    grid-column-end: 12;
    grid-row-start: 2;
    grid-row-end: 3;
    margin-top: -2rem;
  }
  
  .image-3 {
    grid-column-start: 1;
    grid-column-end: 8;
    grid-row-start: 3;
    grid-row-end: 4;
    padding-top: 4rem;
  }
  
  .image-4 {
    grid-column-start: 7;
    grid-column-end: 12;
    grid-row-start: 4;
    grid-row-end: 5;
    margin-top: -2rem;
  }
  
  .image-5 {
    grid-column-start: 1;
    grid-column-end: 6;
    grid-row-start: 5;
    grid-row-end: 6;
    margin-top: -10rem;
    z-index: 2;
  }
  
  .image-6 {
    grid-column-start: 5;
    grid-column-end: 12;
    grid-row-start: 6;
    grid-row-end: 7;
    margin-top: -10rem;
  }
  
  .image-7 {
    grid-column-start: 5;
    grid-column-end: 12;
    grid-row-start: 7;
    grid-row-end: 8;
    margin-top: 8rem;
  }
  
  .image-8 {
    grid-column-start: 1;
    grid-column-end: 6;
    grid-row-start: 8;
    grid-row-end: 9;
    margin-top: -10rem;
    z-index: 2;
  }
  
  .image-9 {
    grid-column-start: 7;
    grid-column-end: 12;
    grid-row-start: 9;
    grid-row-end: 10;
    margin-top: -20rem;
    z-index: 2;
  }
  
  .image-10 {
    grid-column-start: 1;
    grid-column-end: 8;
    grid-row-start: 10;
    grid-row-end: 11;
    margin-top: -8rem;
  }
  
  .image-11 {
    grid-column-start: 5;
    grid-column-end: 12;
    grid-row-start: 11;
    grid-row-end: 12;
    margin-top: 8rem;
    z-index: 2;
  }
  
  .image-12 {
    grid-column-start: 1;
    grid-column-end: 6;
    grid-row-start: 12;
    grid-row-end: 13;
    margin-top: -10rem;
  }
}
</style>