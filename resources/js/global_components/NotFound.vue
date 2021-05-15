<template>
  <div class="container">
    <div class="error">
      <img
        src="https://www.iconpacks.net/icons/2/free-sad-face-icon-2691-thumb.png"
        alt=""
      />
      <h1>404</h1>
      <h3>Not Found</h3>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss">
.container {
  .error {
    width: 100%;
    height: 90vh;
    text-align: center;
    margin-top: 5vh;
    h1{
        font-size: 5rem;
        letter-spacing: 10px;
    }
    h3{
        color: gray;
        font-size: 1.4rem;
    }
    img {
      height: 40vh;
    }
  }
}
</style>