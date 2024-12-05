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
    <img class="image-one" src="../../assets/img/ec/1.jpg" alt="image gallery one"/>
    <img class="image-two" src="../../assets/img/ec/2.jpg" alt="image gallery two"/>
    <img class="image-three" src="../../assets/img/ec/3.jpg" alt="image gallery three"/>
    <img class="image-four" src="../../assets/img/ec/4.jpg" alt="image gallery four"/>
    <img class="image-five" src="../../assets/img/ec/5.jpg" alt="image gallery five"/>
    <img class="image-six" src="../../assets/img/ec/6.jpg" alt="image gallery six"/>
    <img class="image-seven" src="../../assets/img/ec/7.jpg" alt="image gallery seven"/>
    <img class="image-eight" src="../../assets/img/ec/8.jpg" alt="image gallery eight"/>
    <img class="image-nine" src="../../assets/img/ec/9.jpg" alt="image gallery nine"/>
    <img class="image-ten" src="../../assets/img/ec/10.jpg" alt="image gallery ten"/>
    <img class="image-eleven" src="../../assets/img/ec/11.jpg" alt="image gallery eleven"/>
    <img class="image-twelve" src="../../assets/img/ec/12.jpg" alt="image gallery twelve"/>
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
  
  .image-one {
    grid-column-start: 1;
    grid-column-end: 6;
    grid-row-start: 1;
    grid-row-end: 2;
    z-index: 2;
  }
  
  .image-two {
    grid-column-start: 5;
    grid-column-end: 12;
    grid-row-start: 2;
    grid-row-end: 3;
    margin-top: -2rem;
  }
  
  .image-three {
    grid-column-start: 1;
    grid-column-end: 8;
    grid-row-start: 3;
    grid-row-end: 4;
    padding-top: 4rem;
  }
  
  .image-four {
    grid-column-start: 7;
    grid-column-end: 12;
    grid-row-start: 4;
    grid-row-end: 5;
    margin-top: -2rem;
  }
  
  .image-five {
    grid-column-start: 1;
    grid-column-end: 6;
    grid-row-start: 5;
    grid-row-end: 6;
    margin-top: -10rem;
    z-index: 2;
  }
  
  .image-six {
    grid-column-start: 5;
    grid-column-end: 12;
    grid-row-start: 6;
    grid-row-end: 7;
    margin-top: -10rem;
  }
  
  .image-seven {
    grid-column-start: 5;
    grid-column-end: 12;
    grid-row-start: 7;
    grid-row-end: 8;
    margin-top: 8rem;
  }
  
  .image-eight {
    grid-column-start: 1;
    grid-column-end: 6;
    grid-row-start: 8;
    grid-row-end: 9;
    margin-top: -10rem;
    z-index: 2;
  }
  
  .image-nine {
    grid-column-start: 7;
    grid-column-end: 12;
    grid-row-start: 9;
    grid-row-end: 10;
    margin-top: -20rem;
    z-index: 2;
  }
  
  .image-ten {
    grid-column-start: 1;
    grid-column-end: 8;
    grid-row-start: 10;
    grid-row-end: 11;
    margin-top: -8rem;
  }
  
  .image-eleven {
    grid-column-start: 5;
    grid-column-end: 12;
    grid-row-start: 11;
    grid-row-end: 12;
    margin-top: 8rem;
    z-index: 2;
  }
  
  .image-twelve {
    grid-column-start: 1;
    grid-column-end: 6;
    grid-row-start: 12;
    grid-row-end: 13;
    margin-top: -10rem;
  }
}
</style>