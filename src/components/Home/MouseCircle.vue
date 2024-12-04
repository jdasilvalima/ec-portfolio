<script setup>
import { ref, onMounted, onUnmounted } from 'vue';

const mousePosition = ref({ x: 0, y: 0 });

const updateMousePosition = (event) => {
  mousePosition.value = {
    x: event.clientX,
    y: event.clientY,
  };
};

onMounted(() => {
  window.addEventListener('mousemove', updateMousePosition);
});

onUnmounted(() => {
  window.removeEventListener('mousemove', updateMousePosition);
});
</script>

<template>
  <div
    class="mouse-circle"
    :style="{
      left: `${mousePosition.x}px`,
      top: `${mousePosition.y}px`,
    }"
  ></div>
</template>

<style scoped>
.mouse-circle {
  position: fixed;
  width: 350px;
  height: 350px;
  background-color: rgba(255, 255, 255, 0.5);
  border-radius: 80%;
  pointer-events: none;
  filter: blur(50px);
  transform: translate(-50%, -50%);
  z-index: 0;
}
</style>
