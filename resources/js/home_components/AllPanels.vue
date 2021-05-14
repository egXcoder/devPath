<template>
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
</template>

<script>
import panel from "./Panel.vue";
import Masonry from "masonry-layout";

export default {
  components: {
    panel,
  },
  props: {
    category: Object,
  },
  data() {
    return {
      showDeleteBox: false,
      loader: {},
    };
  },
  created() {
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

    this.$store.dispatch("fetchPanels", this.category.name).then(() => {
      this.loader.hide();
      this.$nextTick(() => {
        new Masonry(".grid", {
          // options...
          itemSelector: "#panel",
        });
      });
    });
  },
  mounted() {},
  methods: {},
};
</script>

<style scoped lang="scss">
</style>