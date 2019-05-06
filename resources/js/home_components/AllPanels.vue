<template>
  <div class="container">
    <div class="row">
      <div class="col-4 head">
          <img width="70px" :src="category.image_url">
        <h1>
          {{category.name}} CheatSheet
        </h1>
        <panel class="col-md-12 mt-5" :panel="panels[0]">
          <div slot="panelTitle" class="panel-title">
              <h1>{{panels[0].name}}</h1>
            </div>
        </panel>
      </div>

      <template v-for="(panel,index) in panels">
          <panel v-if="index >= 1" :key="panel.id" :panel="panel">
            <div slot="panelTitle" class="panel-title">
              <h1>{{panel.name}}</h1>
            </div>
          </panel>
      </template>
    </div>
  </div>
</template>

<script>

export default {
  data() {
    return {
      showDeleteBox: false,
      panels: [],
    };
  },
  created() {
    this.fetchPanels();
  },
  props:{
    category:Object
  },
  components: {
    panel: require("./Panel").default
  },
  methods: {
    fetchPanels() {
      this.$http
        .get(document.location.origin + "/api/" + this.category.name + "/panels")
        .then(response => {
          this.panels = response.body.data;
        });
    },
  }
};
</script>