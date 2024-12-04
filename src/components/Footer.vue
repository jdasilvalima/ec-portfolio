<template>
  <footer class="footer-container">
    <hr>
    <div class="footer-content">
      <div class="footer-left">
        <img src="../assets/icons/instagram.png" height="20" alt="Logo Instagram">
        <img src="../assets/icons/mail.png" height="20" alt="Logo E-mail">
      </div>
      <div class="footer-right">
        <p>© 2024 Images par <b>Ernesto C.</b></p>
      </div>
    </div>
  </footer>
</template>

<style scoped>

.footer-container {
  height: 6rem;
  margin: 0 2rem;
}

.hr {
  border: 0;
  height: 2px;
  background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
}

.footer-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 1.5rem;
}

.footer-left img:first-child {
  margin-right: 2rem;
}

.footer-left img {
  transition: transform 0.3s ease-in-out;
}

.footer-left img:hover {
  transform: scale(1.2);
}

img {
  cursor: pointer;
}

@media (min-width: 700px) { 
  .footer-container {
    margin: 0 10rem;
  }
}


</style>