<template>
  <!-- <div class="image-effect">
    <img class="js-image" width="700" src="@/assets/img/supaAmazingImage.jpg" alt="image gallery one"/>
    <h2>Some title</h2>
    <p>Lorem ipsum.</p>
  </div> -->
  <header class="header">
    <h1 class="header__title">Interactive Hover Effects with Three.js</h1>
    <div class="info">
      TEST
    </div>
    </header>
    <div ref="imgContainerTest" id="imageContainer">
      <img ref="imgTest" src="@/assets/img/supaAmazingImage.jpg" alt="Some image" id="myImage">
    </div>
</template>

<script setup>
// https://www.youtube.com/watch?v=V8GnInBUMLo&ab_channel=ConorBailey
// https://github.com/conorbailey90/RGB-Split-Hover-Effect/blob/main/js/app.js
// nope : https://tympanus.net/codrops/2019/10/21/how-to-create-motion-hover-effects-with-image-distortions-using-three-js/

import * as THREE from "three";
import { onMounted, onUnmounted, ref } from 'vue';

// variables
const imageContainer = document.getElementById("imageContainer");
const imageElement = document.getElementById("myImage");

const imgTest = ref(null);
const imgContainerTest = ref(null);

let easeFactor = ref(0.02);
let scene, camera, renderer, planeMesh;
let mousePosition = ref({ x: 0.5, y: 0.5 });
let targetMousePosition = ref({ x: 0.5, y: 0.5 });
let mouseStopTimeout;
let aberrationIntensity = ref(0.0);
let lastPosition = ref({ x: 0.5, y: 0.5 });
let prevPosition = ref({ x: 0.5, y: 0.5 });

// shaders
const vertexShader = `
    varying vec2 vUv;
    void main() {
      vUv = uv;
      gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
    }
`;

const fragmentShader = `
  varying vec2 vUv;
  uniform sampler2D u_texture;    
  uniform vec2 u_mouse;
  uniform vec2 u_prevMouse;
  uniform float u_aberrationIntensity;

  void main() {
    vec2 gridUV = floor(vUv * vec2(20.0, 20.0)) / vec2(20.0, 20.0);
    vec2 centerOfPixel = gridUV + vec2(1.0/20.0, 1.0/20.0);
    
    vec2 mouseDirection = u_mouse - u_prevMouse;
    
    vec2 pixelToMouseDirection = centerOfPixel - u_mouse;
    float pixelDistanceToMouse = length(pixelToMouseDirection);
    float strength = smoothstep(0.3, 0.0, pixelDistanceToMouse);

    vec2 uvOffset = strength * - mouseDirection * 0.2;
    vec2 uv = vUv - uvOffset;

    vec4 colorR = texture2D(u_texture, uv + vec2(strength * u_aberrationIntensity * 0.01, 0.0));
    vec4 colorG = texture2D(u_texture, uv);
    vec4 colorB = texture2D(u_texture, uv - vec2(strength * u_aberrationIntensity * 0.01, 0.0));

    gl_FragColor = vec4(colorR.r, colorG.g, colorB.b, 1.0);
  }
`;


onMounted(() => {
  // use the existing image from html in the canvas
  initializeScene(new THREE.TextureLoader().load(imgTest.value.src));

  animateScene();

  // event listeners
  imgContainerTest.value.addEventListener("mousemove", handleMouseMove);
  imgContainerTest.value.addEventListener("mouseenter", handleMouseEnter);
  imgContainerTest.value.addEventListener("mouseleave", handleMouseLeave);
})

function initializeScene(texture) {
  //   scene creation
  scene = new THREE.Scene();

  // camera setup
  camera = new THREE.PerspectiveCamera(
    80,
    imgTest.value.offsetWidth / imgTest.value.offsetHeight,
    0.01,
    10
  );
  camera.position.z = 1;

  //   uniforms
  let shaderUniforms = {
    u_mouse: { type: "v2", value: new THREE.Vector2() },
    u_prevMouse: { type: "v2", value: new THREE.Vector2() },
    u_aberrationIntensity: { type: "f", value: 0.0 },
    u_texture: { type: "t", value: texture }
  };

  //   creating a plane mesh with materials
  planeMesh = new THREE.Mesh(
    new THREE.PlaneGeometry(2, 2),
    new THREE.ShaderMaterial({
      uniforms: shaderUniforms,
      vertexShader,
      fragmentShader
    })
  );

  //   add mesh to scene
  scene.add(planeMesh);

  //   render
  renderer = new THREE.WebGLRenderer();
  renderer.setSize(imgTest.value.offsetWidth, imgTest.value.offsetHeight);

  //   create a canvas
  imgContainerTest.value.appendChild(renderer.domElement);
};

function animateScene() {
  requestAnimationFrame(animateScene);

  mousePosition.value.x += (targetMousePosition.value.x - mousePosition.value.x) * easeFactor.value;
  mousePosition.value.y += (targetMousePosition.value.y - mousePosition.value.y) * easeFactor.value;

  planeMesh.material.uniforms.u_mouse.value.set(
    mousePosition.value.x,
    1.0 - mousePosition.value.y
  );

  planeMesh.material.uniforms.u_prevMouse.value.set(
    prevPosition.value.x,
    1.0 - prevPosition.value.y
  );

  aberrationIntensity.value = Math.max(0.0, aberrationIntensity.value - 0.05);

  planeMesh.material.uniforms.u_aberrationIntensity.value = aberrationIntensity.value;

  renderer.render(scene, camera);
};

function handleMouseMove(event) {
  easeFactor.value = 0.02;
  let rect = imgContainerTest.value.getBoundingClientRect();
  prevPosition.value = { ...targetMousePosition.value };

  targetMousePosition.value.x = (event.clientX - rect.left) / rect.width;
  targetMousePosition.value.y = (event.clientY - rect.top) / rect.height;

  aberrationIntensity.value = 1;
}

function handleMouseEnter(event) {
  easeFactor.value = 0.02;
  let rect = imgContainerTest.value.getBoundingClientRect();

  mousePosition.value.x = targetMousePosition.value.x = (event.clientX - rect.left) / rect.width;
  mousePosition.value.y = targetMousePosition.value.y = (event.clientY - rect.top) / rect.height;
}

function handleMouseLeave() {
  easeFactor.value = 0.05;
  targetMousePosition.value = { ...prevPosition.value };
}

</script>

<style>
.image-effect {
  background-color: antiquewhite;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

canvas {
  display: block;
}

#imageContainer {
  position: relative;
  width: 800px;
  height: 800px;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 10px;
  max-width: 100%;
  filter: saturate(0);
  transition: all ease 0.5s;
}

#imageContainer:hover {
  filter: saturate(100%);
}

#imageContainer > * {
  position: absolute;
  inset: 0;
  width: 100% !important;
  height: 100% !important;
  object-fit: cover;
}
</style>