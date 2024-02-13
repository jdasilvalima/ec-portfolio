<script setup>
import { ref, onMounted } from 'vue';
import { gsap } from 'gsap';

let cursor;
let bigBall;

let body;
let widthMatches = false;

onMounted(() => {
  cursor = document.querySelector(".cursor");
  body = document.body;

  bigBall = document.querySelector(".cursor__ball--big");

  // Listeners
  var x = window.matchMedia("(min-width: 768px)");
  togglePageCursor(x);
  x.addListener(togglePageCursor);

  body.addEventListener("mousemove", onMouseMove);
  document.querySelectorAll(".hoverable").forEach((e) => {
    e.addEventListener("mouseenter", onMouseHover);
    e.addEventListener("mouseleave", onMouseHoverOut);
  });
});

function togglePageCursor(e) {
  if (e.matches) {
    widthMatches = true;
    //body.style.cursor = "none";
  } else {
    widthMatches = false;
    //body.style.cursor = "";
    //cursor.style.display = "none";
  }
}

// Move the cursor
function onMouseMove(e) {
  if (widthMatches) {
    //cursor.style.display = "block";
  }

  gsap.to(bigBall, {
    x: e.pageX - 20,
    y: e.pageY - 15,
    duration: 0.4,
    ease: "ease-in-out"
  });
}

// Hover an element
// function onMouseHover() {
//   gsap.to(bigBall, {
//     scale: 4,
//     duration: 0.3
//   });
// }

// function onMouseHoverOut() {
//   gsap.to(bigBall, {
//     scale: 1,
//     duration: 0.3
//   });
// }
</script>

<template>
  <div class="cursor">
    <div class="cursor__ball cursor__ball--big">
        <svg height="40" width="40">
          <circle cx="20" cy="20" r="20" stroke-width="0"></circle>
        </svg>
    </div>
  </div>
</template>

<style>
.cursor__ball {
  left: 0;
  mix-blend-mode: difference;
  position: fixed;
  top: 0;
  z-index: 1000;
}

circle {
  fill: #e8e9e9;
}
</style>