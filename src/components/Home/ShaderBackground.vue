<template>
  <canvas ref="webglCanvas" class="fixed inset-0 w-full h-full" />
</template>

<script setup>
import * as THREE from 'three'
import { ref, onMounted, onUnmounted } from 'vue'

const webglCanvas = ref(null)

let scene, camera, renderer, material, mesh, clock
let animationFrameId

const vertexShader = `
  varying vec2 vUv;
  void main() {
    vUv = uv;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
  }
`

const fragmentShader = `
  uniform float iTime;
  uniform vec2 iResolution;
  varying vec2 vUv;

  #define S(a,b,t) smoothstep(a,b,t)

  mat2 Rot(float a) {
    float s = sin(a);
    float c = cos(a);
    return mat2(c, -s, s, c);
  }

  vec2 hash(vec2 p) {
    p = vec2(dot(p, vec2(2127.1, 81.17)), dot(p, vec2(1269.5, 283.37)));
    return fract(sin(p) * 43758.5453);
  }

  float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    
    vec2 u = f * f * (3.0 - 2.0 * f);
    float n = mix(
      mix(
        dot(-1.0 + 2.0 * hash(i + vec2(0.0, 0.0)), f - vec2(0.0, 0.0)), 
        dot(-1.0 + 2.0 * hash(i + vec2(1.0, 0.0)), f - vec2(1.0, 0.0)), 
        u.x
      ),
      mix(
        dot(-1.0 + 2.0 * hash(i + vec2(0.0, 1.0)), f - vec2(0.0, 1.0)), 
        dot(-1.0 + 2.0 * hash(i + vec2(1.0, 1.0)), f - vec2(1.0, 1.0)), 
        u.x
      ), 
      u.y
    );
    return 0.5 + 0.5 * n;
  }

  void main() {
    vec2 fragCoord = vUv * iResolution.xy;
    
    vec2 uv = fragCoord / iResolution.xy;
    float ratio = iResolution.x / iResolution.y;
    vec2 tuv = uv;
    tuv -= 0.5;

    // Rotation with noise
    float degree = noise(vec2(iTime * 0.1, tuv.x * tuv.y));
    tuv.y *= 1.0 / ratio;
    tuv *= Rot(radians((degree - 0.5) * 720.0 + 180.0));
    tuv.y *= ratio;
    
    // Wave modification
    float frequency = 5.0;
    float amplitude = 80.0;
    float speed = iTime * 0.09;
    tuv.x += sin(tuv.y * frequency + speed) / amplitude;
    tuv.y += sin(tuv.x * frequency * 1.5 + speed) / (amplitude * 0.5);
    
    // Draw Image
    vec3 colorWhite = vec3(1.0, 1.0, 1.0);
    vec3 colorDeepBlue = vec3(0.192, 0.384, 0.933);
    vec3 layer1 = mix(colorWhite, colorDeepBlue, S(-0.2, 0.9, (tuv * Rot(radians(-5.0))).x));
    
    vec3 colorBlue = vec3(0.192, 0.384, 0.933);
    vec3 white = vec3(1.0, 1.0, 1.0);
    vec3 layer2 = mix(colorBlue, white, S(-0.9, 0.1, (tuv * Rot(radians(-5.0))).x));
    
    vec3 finalComp = mix(layer1, layer2, S(0.5, -0.3, tuv.y));
    
    gl_FragColor = vec4(finalComp, 0.9);
  }
`

onMounted(() => {
  scene = new THREE.Scene()
  camera = new THREE.OrthographicCamera(-1, 1, 1, -1, 0, 1)
  
  renderer = new THREE.WebGLRenderer({ 
    canvas: webglCanvas.value,
    alpha: true 
  })
  
  renderer.setSize(window.innerWidth, window.innerHeight)

  clock = new THREE.Clock()

  material = new THREE.ShaderMaterial({
    vertexShader,
    fragmentShader,
    uniforms: {
      iTime: { value: 0 },
      iResolution: { value: new THREE.Vector2(window.innerWidth, window.innerHeight) }
    }
  })

  const geometry = new THREE.PlaneGeometry(2, 2)
  mesh = new THREE.Mesh(geometry, material)
  scene.add(mesh)

  function animate() {
    animationFrameId = requestAnimationFrame(animate)
    
    material.uniforms.iTime.value = clock.getElapsedTime()
    
    renderer.render(scene, camera)
  }

  animate()

  window.addEventListener('resize', onResize)
})

function onResize() {
  if (renderer) {
    renderer.setSize(window.innerWidth, window.innerHeight)
    material.uniforms.iResolution.value.set(window.innerWidth, window.innerHeight)
  }
}

onUnmounted(() => {
  if (animationFrameId) {
    cancelAnimationFrame(animationFrameId)
  }
  window.removeEventListener('resize', onResize)
  
  if (renderer) {
    renderer.dispose()
  }
})
</script>