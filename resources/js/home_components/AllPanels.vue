<template>
  <div class="all-panels">
    <sidebar></sidebar>
    <div class="container-fluid">
      <div class="col-md-12 head">
        <img width="100px" :src="category.image_url" />
        <h1>{{ category.name }} Path</h1>
      </div>
      <div class="grid">
        <template v-for="panel in $store.getters.panels(category.name)">
          <panel :key="panel.id" :panel="panel">
            <div slot="panel_title" class="panel-title">
              <h1>{{ panel.name }}</h1>
            </div>
          </panel>
        </template>
      </div>
    </div>
  </div>
</template>

<script>
import panel from "./Panel.vue";
import Masonry from "masonry-layout";
import Sidebar from "../home_components/Sidebar";

export default {
  components: {
    panel,
    Sidebar,
  },
  data() {
    return {
      showDeleteBox: false,
      loader: null,
    };
  },
  computed: {
    category() {
      let category = this.$store.state.categoryPanels[this.$route.params.category];
      return category ? category : {};
    },
  },
  watch: {
    $route: {
      immediate: true,
      handler() {
        this.showLoader();

        if (this.isPanelsAlreadyExistsOnVuex()) {
          return this.afterPanelLoaded();
        }

        this.$store.dispatch("fetchPanels", this.$route.params.category).then(() => {
          this.afterPanelLoaded();
        });
      },
    },
  },
  methods: {
    showLoader() {
      if (!this.loader) {
        this.loader = this.$loading.show({
          // Pass props by their camelCased names
          container: this.$refs.loadingContainer,
          canCancel: true, // default false
          color: "#2f6575",
          loader: "bars",
          width: 128,
          height: 128,
          backgroundColor: "#ffffff",
          opacity: 0.5,
          zIndex: 999,
        });
      }
    },
    isPanelsAlreadyExistsOnVuex() {
      return this.$store.getters.panels(this.$route.params.category);
    },
    afterPanelLoaded() {
      this.$nextTick(this.initializeGrid);
    },
    initializeGrid() {
      if (this.loader) {
        this.loader.hide();
        this.loader = null;
      }

      new Masonry(".grid", {
        // options...
        itemSelector: "#panel",
      });
    },
  },
};
</script>

<style scoped lang="scss">
.all-panels {
  .head {
    margin: 2rem 0rem;
    text-align: center;
  }
}
</style>