<script setup>
import { onMounted } from 'vue';
import SplitType from 'split-type';
import { gsap } from 'gsap';
import ImageDistortion from '@/components/Home/ImageDistortion.vue';

const images = [
  { src: "./img/ec/1.jpg", alt: "Image gallery 1", gridArea: "1 / 1 / 2 / 6" },
  { src: "./img/ec/2.jpg", alt: "Image gallery 2", gridArea: "2 / 5 / 3 / 12" },
  { src: "./img/ec/3.jpg", alt: "Image gallery 3", gridArea: "3 / 1 / 4 / 8" },
  { src: "./img/ec/4.jpg", alt: "Image gallery 4", gridArea: "4 / 7 / 5 / 12" },
  { src: "./img/ec/5.jpg", alt: "Image gallery 5", gridArea: "5 / 1 / 6 / 6" },
  { src: "./img/ec/6.jpg", alt: "Image gallery 6", gridArea: "6 / 5 / 7 / 12" },
  { src: "./img/ec/7.jpg", alt: "Image gallery 7", gridArea: "7 / 5 / 8 / 12" },
  { src: "./img/ec/8.jpg", alt: "Image gallery 8", gridArea: "8 / 1 / 9 / 6" },
  { src: "./img/ec/9.jpg", alt: "Image gallery 9", gridArea: "9 / 7 / 10 / 12" },
  { src: "./img/ec/10.jpg", alt: "Image gallery 10", gridArea: "10 / 1 / 11 / 8" },
  { src: "./img/ec/11.jpg", alt: "Image gallery 11", gridArea: "11 / 5 / 12 / 12" },
  { src: "./img/ec/12.jpg", alt: "Image gallery 12", gridArea: "12 / 1 / 13 / 6" },
];

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
    <img 
      v-for="(image, index) in images" 
      :key="index" 
      :src="image.src" 
      :alt="image.alt" 
      :style="{ gridArea: image.gridArea }" 
    />
    <!-- <ImageDistortion
      v-for="(image, index) in images"
      :key="index"
      :imageUrl="image.src"
      :style="{ gridArea: image.gridArea }"
    /> -->
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
    z-index: 2;
  }
  
  .image-2 {
    margin-top: -2rem;
  }
  
  .image-3 {
    padding-top: 4rem;
  }
  
  .image-4 {
    margin-top: -2rem;
  }
  
  .image-5 {
    margin-top: -10rem;
    z-index: 2;
  }
  
  .image-6 {
    margin-top: -10rem;
  }
  
  .image-7 {
    margin-top: 8rem;
  }
  
  .image-8 {
    margin-top: -10rem;
    z-index: 2;
  }
  
  .image-9 {
    margin-top: -20rem;
    z-index: 2;
  }
  
  .image-10 {
    margin-top: -8rem;
  }
  
  .image-11 {
    margin-top: 8rem;
    z-index: 2;
  }
  
  .image-12 {
    margin-top: -10rem;
  }
}
</style>