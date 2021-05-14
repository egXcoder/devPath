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
          <!-- @if (Route::currentRouteName()==='admin.index'||Route::currentRouteName()==='admin.show')
        <form id="logout-form" action="{{ route('logout') }}" method="POST">
          @csrf
          <button type="submit" class="btn btn-link d-block mx-auto">Logout</button>
        </form>
        @endif -->
        </div>
      </div>
    </nav>

    <div class="navigation-drawer" @click="toggleDrawer()" :class="{ show: isDrawerOn }"></div>

    <div class="collapsed-menu" :class="{ show: isDrawerOn }">
      <div class="header">
        <a class="brand text-decoration-none" href="/">
          <img src="/images/brand.png" alt="" />
          <p>DevBooster</p>
        </a>
        <div @click="toggleDrawer()" class="closeButton">
          <a><i class="fas fa-sign-out-alt fa-2x"></i></a>
        </div>
      </div>
      <div class="menu-container">
        <ul class="list-unstyled">
          <li v-for="(category, index) in $store.state.categories" :key="index">
            <img class="img-fluid" :src="category.image_url" />
            <a :href="category.name">{{ category.name }}</a>
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
  created() {
    this.fetchCategories();
  },
  methods: {
    toggleDrawer() {
      this.isDrawerOn = !this.isDrawerOn;
    },
    fetchCategories() {
      if (this.$store.state.categories.length <= 0) {
        this.$store.dispatch("fetchCategories");
      }
    },
  },
};
</script>

<style>
</style>