<template>
  <div class="container">
    <div class="row">
      <loading :active.sync="is_loading" :can-cancel="true" :is-full-page="fullPage"></loading>
        
      <div class="col-lg-4 col-md-6 head">
          <img width="70px" :src="category.image_url">
        <h1>
          {{category.name}} CheatSheet
        </h1>
        <panel class="col-lg-12 col-md-12 mt-5" :panel="panels[0]">
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
import panel from "./Panel.vue";
import loading from 'vue-loading-overlay';
export default {
  data() {
    return {
      showDeleteBox: false,
      panels: [],
      is_loading: true,
      fullPage: true
    };
  },
  mounted() {
    this.fetchPanels();
  },
  props:{
    category:Object
  },
  components: {
    panel,
    loading,
  },
  methods: {
    fetchPanels() {
      this.is_loading = true;
      this.$http
        .get(document.location.origin + "/api/" + this.category.name + "/panels")
        .then(response => {
          this.panels = response.body.data;
          this.is_loading = false;
        });
    },
  }
};
</script>