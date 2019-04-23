<template>
  <div class="container">
    <div class="row">
      <div class="col-12 head">
        <h1>
          <img width="70px" src="images/cheatsheet.png"> JQuery CheatSheet
        </h1>
      </div>
      <template v-for="panel in panels">
        <panel :key="panel.name" :panel="panel"></panel>
      </template>
      <div class="col-md-4 p-2">
        <div v-on:click="addPanel()" class="add-box"><div class="btn btn-primary">+</div></div>
      </div>
    </div>
  </div>
</template>

<script>
import panel from "./Panel";
export default {
  data() {
    return {
      categoryTitle : 'aut',
      panels: []
    };
  },
  created() {
    this.fetchPanels();
  },
  components: {
    panel
  },
  methods:{
    addPanel:function(){
      this.$http.post("http://127.0.0.1:8000/api/"+this.categoryTitle+"/panels/create").then(function(){
        this.fetchPanels();
      })
    },
    fetchPanels(){
      this.$http.get("http://127.0.0.1:8000/api/"+this.categoryTitle+"/panels").then(function(data) {
      this.panels = data.body.data;
      });
    },
  }
  
};
</script>