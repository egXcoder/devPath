<template>
  <div class="container">
    <div class="row">
      <div class="col-4 head">
        <h1>
          <img width="70px" src="/images/cheatsheet.png">
          {{category_title}} CheatSheet
        </h1>
      </div>

      <template v-for="panel in panels">
          <panel :key="panel.id" :panel="panel">
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
  components: {
    panel: require("./Panel").default
  },
  methods: {
    fetchPanels() {
      this.$http
        .get(this.$shared.siteUrl + "/api/" + this.$shared.category_title + "/panels")
        .then(response => {
          this.panels = response.body.data;
        });
    },
  }
};
</script>