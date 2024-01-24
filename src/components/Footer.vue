<template>
  <footer class="footer-container">
    <hr>
    <div class="footer-content">
      <div class="footer-left">
        <img src="../assets/icons/linkedin.png" width="30" alt="Logo LinkedIn">
        <img src="../assets/icons/mail.png" width="30" alt="Logo E-mail">
      </div>
      <div class="footer-right">
        <p>© 2024 Images par Ernesto C.</p>
      </div>
    </div>
  </footer>
</template>

<style scoped>

.footer-container {
  background-color: #d6d6d6;
  height: 5rem;
  margin: 0 10rem;
}

.hr {
  border: 0;
  height: 1px;
  background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
}

.footer-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.footer-left {
  text-align: left;
}

.footer-right {
  text-align: right;
}

</style>