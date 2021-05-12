<template>
  <div class="container-fluid">
    <div class="row">
        
      <div class="col-lg-4 col-md-6 head">
          <img width="100px" :src="category.image_url">
        <h1>
          {{category.name}} Path
        </h1>
        <panel class="col-lg-12 col-md-12 mt-5" v-if="panels[0]" :panel="panels[0]">
          <div slot="panel_title" class="panel-title">
              <h1>{{panels[0].name}}</h1>
            </div>
        </panel>
      </div>

      <template v-for="(panel,index) in panels">
          <panel v-if="index >= 1" :key="panel.id" :panel="panel">
            <div slot="panel_title" class="panel-title">
              <h1>{{panel.name}}</h1>
            </div>
          </panel>
      </template>
    </div>
  </div>
</template>

<script>
import panel from "./Panel.vue";
export default {
  data() {
    return {
      showDeleteBox: false,
      panels: [],
      loader:{},
    };
  },
  created(){
    this.loader = Vue.$loading.show({
            // Pass props by their camelCased names
            container: this.$refs.loadingContainer,
            canCancel: true, // default false
            color: '#2f6575',
            loader: 'bars',
            width: 128,
            height: 128,
            backgroundColor: '#ffffff',
            opacity: 0.5,
            zIndex: 999,
        });
    this.fetchPanels();
  },
  props:{
    category:Object
  },
  components: {
    panel,
  },
  methods: {
    fetchPanels() {
      this.$http
        .get(base_path() + "/api/" + this.category.name + "/panels")
        .then(response => {
          this.panels = response.body.data;
          this.loader.hide();
        });
    },
  }
};
</script>