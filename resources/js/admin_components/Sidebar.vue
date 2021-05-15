<template>
  <div>
    <nav class="nav">
      <div class="container-fluid">
        <div class="d-flex justify-content-between">
          <div class="menu-toggle my-auto" @click="toggleDrawer()">
            <span></span>
            <span></span>
            <span></span>
          </div>
        </div>
      </div>
    </nav>

    <div class="navigation-drawer" @click="toggleDrawer()" :class="{ show: isDrawerOn }"></div>

    <div class="collapsed-menu" :class="{ show: isDrawerOn }">
      <div class="header">
        <router-link class="brand text-decoration-none" to="/home" @click.native="toggleDrawer()">
          <img src="/images/brand.png" alt="" />
          <p>DevBooster</p>
        </router-link>
        <div @click="toggleDrawer()" class="closeButton">
          <a><i class="fas fa-sign-out-alt fa-2x"></i></a>
        </div>
      </div>
      <div class="menu-container">
        <ul class="list-unstyled">
          <li v-for="(category, index) in $store.state.categoryPanels" :key="index">
            <router-link :to="'/admin/' + category.name" @click.native="toggleDrawer()">
              <img class="img-fluid" :src="category.image_url" />
              {{ category.name }}
            </router-link>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isDrawerOn: false,
    };
  },
  methods: {
    toggleDrawer() {
      this.isDrawerOn = !this.isDrawerOn;
    },
  },
};
</script>

<style>
</style>