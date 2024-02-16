<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue';

let mouseX = ref(0);
let mouseY = ref(0);
let xp = ref(0);
let yp = ref(0);
let intervalId;

onMounted(() => {
  const onMouseMove = (e) => {
    mouseX.value = e.pageX - 30;
    mouseY.value = e.pageY - 30;
  };

  intervalId = setInterval(() => {
    xp.value += (mouseX.value - xp.value) / 6;
    yp.value += (mouseY.value - yp.value) / 6;
    document.getElementById('circle').style.left = xp.value + 'px';
    document.getElementById('circle').style.top = yp.value + 'px';
  }, 20);

  document.addEventListener('mousemove', onMouseMove);
});

onBeforeUnmount(() => {
  clearInterval(intervalId);
});
</script>

<template>
  <span id="circle">
    <svg height="40" width="40">
      <circle cx="20" cy="20" r="20" stroke-width="0"></circle>
    </svg>
  </span>
</template>

<style>
#circle {
  position: absolute;
  z-index: 10;
  fill: #e8e9e9;
}
</style>