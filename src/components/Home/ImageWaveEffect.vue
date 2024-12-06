<template>
  <div ref="container" class="webgl-container"></div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue';
import * as THREE from 'three';
import { EffectComposer } from 'three/examples/jsm/postprocessing/EffectComposer.js';
import { RenderPass } from 'three/examples/jsm/postprocessing/RenderPass.js';
import { ShaderPass } from 'three/examples/jsm/postprocessing/ShaderPass.js';

// Référence à l'élément du DOM
const container = ref(null);

// Variables pour la scène Three.js
let renderer, scene, camera, composer, customPass, uMouse = new THREE.Vector2(0, 0);

onMounted(() => {
  initScene();
  loadTexture('./supaAmazingImage.jpg');
  window.addEventListener('resize', onResize);
  document.addEventListener('mousemove', onMouseMove);
});

onBeforeUnmount(() => {
  window.removeEventListener('resize', onResize);
  document.removeEventListener('mousemove', onMouseMove);
});

const initScene = () => {
  // Render
  renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true }); //OK
  renderer.setSize(window.innerWidth, window.innerHeight); //OK
  renderer.setPixelRatio(window.devicePixelRatio);
  renderer.setClearColor(0xffffff, 1); //To remove later
  renderer.outputEncoding = THREE.sRGBEncoding;
  container.value.appendChild(renderer.domElement); //OK

  // Scene
  scene = new THREE.Scene(); //OK
  camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight, 0.1, 1000); //OK
  camera.position.z = 0.5; //OK

  // Postprocessing
  composer = new EffectComposer(renderer);
  const renderPass = new RenderPass(scene, camera);
  composer.addPass(renderPass);
};

// Texture and add mesh
const loadTexture = (imageUrl) => {
  const loader = new THREE.TextureLoader();
  loader.load(
    imageUrl,
    (texture) => {
      addMesh(texture);
      addPostProcessing();
      animate(); //OK
    },
    undefined,
    (error) => {
      console.error('Error loading texture:', error);
    }
  );
};

const addMesh = (texture) => {
  const geometry = new THREE.PlaneGeometry(0.45, 0.3);
  const material = new THREE.MeshBasicMaterial({ map: texture });
  const mesh = new THREE.Mesh(geometry, material);
  scene.add(mesh);
};

const addPostProcessing = () => {
  const myEffect = {
    uniforms: {
      tDiffuse: { value: null },
      resolution: { value: new THREE.Vector2(1.0, window.innerHeight / window.innerWidth) },
      uMouse: { value: new THREE.Vector2(-10, -10) },
    },
    vertexShader: `
      varying vec2 vUv;
      void main() {
        vUv = uv;
        gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
      }
    `,
    fragmentShader: `
      uniform sampler2D tDiffuse;
      uniform vec2 resolution;
      uniform vec2 uMouse;
      varying vec2 vUv;
      float circle(vec2 uv, vec2 disc_center, float disc_radius, float border_size) {
        uv -= disc_center;
        uv *= resolution;
        float dist = sqrt(dot(uv, uv));
        return smoothstep(disc_radius + border_size, disc_radius - border_size, dist);
      }
      void main() {
        vec2 newUV = vUv;
        float c = circle(vUv, uMouse, 0.0, 0.2);
        vec3 color = texture2D(tDiffuse, newUV.xy + c * 0.1).rgb;
        gl_FragColor = vec4(color, 1.0);
      }
    `,
  };

  customPass = new ShaderPass(myEffect);
  customPass.renderToScreen = true;
  composer.addPass(customPass);
};

const animate = () => { //OK
  customPass.uniforms.uMouse.value = uMouse;
  requestAnimationFrame(animate); //OK
  composer.render(scene, camera); //OK
};

const onMouseMove = (event) => {
  uMouse.x = event.clientX / window.innerWidth;
  uMouse.y = 1.0 - event.clientY / window.innerHeight;
};

const onResize = () => {
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();
  renderer.setSize(window.innerWidth, window.innerHeight);
  customPass.uniforms.resolution.value.set(1.0, window.innerHeight / window.innerWidth);
};

</script>

<style scoped>
.webgl-container {
  width: 100%;
  height: 100vh;
  overflow: hidden;
}
</style>