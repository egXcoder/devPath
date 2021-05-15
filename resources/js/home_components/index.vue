<template>
  <div class="all-categories">
    <div class="container">
      <div class="search-container">
        <input type="text" class="form-control" placeholder="Search..." />
        <i class="fas fa-search"></i>
      </div>
      <div class="row">
        <template v-for="(category, index) in $store.state.categoryPanels">
          <router-link :to="category.name" :key="index" class="col-lg-3 col-md-4 col-sm-6 category">
            <div>
              <img :src="category.image_url" class="img-fluid" />
              <p>{{ category.name }}</p>
            </div>
          </router-link>
        </template>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
.all-categories {
  padding: 1rem;
  .search-container {
    display: flex;
    input {
      width: 90%;
      flex-grow: 1;
    }
    i {
      text-align: center;
      width: 40px;
      padding: 5px;
      background: var(--secondary-color);
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
    }
  }
  .category {
    margin: 1rem 0rem;
    text-decoration: none;
    transition: transform 0.4s;
    div {
      text-align: center;
      box-shadow: 0 0.5rem 1rem rgb(0 0 0 / 15%) !important;
      img {
        margin: 1rem;
        height: 70px;
      }
      p {
        text-transform: capitalize;
        margin-bottom: 0px;
        padding: 1rem;
        background: var(--third-color);
        color: var(--primary-color);
      }
    }
    &:hover {
      transform: translateY(-5px);
    }
  }
}
</style>