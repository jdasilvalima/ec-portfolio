<template>
  <div class="small-gallery">
    <div class="small-gallery-presentation">
      <span>My pictures</span>
      <span>Landscape / Portrait / Nature / Architecture</span>
    </div>
    <img class="image-one" src="https://images.unsplash.com/photo-1698426665412-4bf9ee4b510f?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image gallery one"/>
    <img class="image-two" src="https://images.unsplash.com/photo-1639762364576-2c780928e264?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image gallery two"/>
    <img class="image-three" src="https://images.unsplash.com/photo-1620408583014-251b06dca892?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image gallery three"/>
    <img class="image-four" src="https://images.unsplash.com/photo-1699492583823-a087cfa72173?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image gallery four"/>
    <img class="image-five" src="https://images.unsplash.com/photo-1688151049003-7547bb8fdd4f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image gallery five"/>
    <img class="image-six" src="https://images.unsplash.com/photo-1688150711771-51869eb07cad?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image gallery six"/>
    <img class="image-seven" src="https://images.unsplash.com/photo-1688150711771-51869eb07cad?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image gallery seven"/>
    <img class="image-eight" src="https://images.unsplash.com/photo-1625071185882-500c3b593b86?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image gallery eight"/>
  </div>
</template>

<style scoped>
.small-gallery {
  display: grid;
  grid-template-columns: repeat(11,1fr);
  grid-template-rows: auto;
  background-color: rgb(229, 229, 229);
  margin: 0 10rem;
}

.small-gallery-presentation {
  grid-column-start: 7;
  grid-column-end: 12;
  display: flex;
  flex-direction: column;
}

.image-one {
  grid-column-start: 1;
  grid-column-end: 6;
  grid-row-start: 1;
  grid-row-end: 2;
  width: 100%;
  height: auto;
  z-index: 1;
}

.image-two {
  grid-column-start: 5;
  grid-column-end: 12;
  grid-row-start: 2;
  grid-row-end: 3;
  width: 100%;
  height: auto;
  margin-top: -2rem;
}

.image-three {
  grid-column-start: 1;
  grid-column-end: 8;
  grid-row-start: 3;
  grid-row-end: 4;
  width: 100%;
  height: auto;
  padding-top: 4rem;
}

.image-four {
  grid-column-start: 7;
  grid-column-end: 12;
  grid-row-start: 4;
  grid-row-end: 5;
  width: 100%;
  height: auto;
  margin-top: -2rem;
}

.image-five {
  grid-column-start: 1;
  grid-column-end: 6;
  grid-row-start: 5;
  grid-row-end: 6;
  width: 100%;
  height: auto;
  margin-top: -10rem;
  z-index: 1;
}

.image-six {
  grid-column-start: 5;
  grid-column-end: 12;
  grid-row-start: 6;
  grid-row-end: 7;
  width: 100%;
  height: auto;
  margin-top: -10rem;
}

.image-seven {
  grid-column-start: 5;
  grid-column-end: 12;
  grid-row-start: 7;
  grid-row-end: 8;
  width: 100%;
  height: auto;
  margin-top: 8rem;
}

.image-eight {
  grid-column-start: 1;
  grid-column-end: 6;
  grid-row-start: 8;
  grid-row-end: 9;
  width: 100%;
  height: auto;
  margin-top: -10rem;
  z-index: 1;
}
</style>