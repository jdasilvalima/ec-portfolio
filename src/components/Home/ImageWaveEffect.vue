<template>
  <div class="image-effect">
    <img class="js-image" width="700" src="@/assets/img/supaAmazingImage.jpg" alt="image gallery one"/>
    <h2>Some title</h2>
    <p>Lorem ipsum.</p>
  </div>
</template>

<script setup>
import { onMounted } from "vue";
import * as THREE from "three";

onMounted (() => {
  intialiseThreejs();
})

function intialiseThreejs() {
  var scene = new THREE.Scene();
  var camera = new THREE.PerspectiveCamera( 75, window.innerWidth/window.innerHeight, 0.1, 1000 );

  var renderer = new THREE.WebGLRenderer();
  renderer.setSize( window.innerWidth, window.innerHeight );
  document.body.appendChild( renderer.domElement );


  camera.position.z = 5;

  let TEXTURE = new THREE.TextureLoader().load('@/assets/img/supaAmazingImage.jpg'); 

  let geometry = new THREE.BoxGeometry(1, 1, 1);
  let material = new THREE.MeshBasicMaterial({ map: TEXTURE });
  let mesh = new THREE.Mesh(geometry, material);


  scene.add(mesh);

  function animate() {
    renderer.render(scene, camera);
    requestAnimationFrame(animate);
  }

  animate();
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
</style>