<template>
  <div class="container">
    <div :style="grid_style" class="row">
      <div class="col-4 head">
          <img width="70px" :src="$shared.category_image">
        <h1>
          {{$shared.category_title}} CheatSheet
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
  components: {
    panel: require("./Panel").default
  },
  computed:{
    grid_style(){
      return {
      'flex-flow': 'column wrap',
      'max-height': ((this.panels.length*900)/3)+'px',
      }
    }
  },
  methods: {
    fetchPanels() {
      this.$http
        .get(document.location.origin + "/api/" + this.$shared.category_title + "/panels")
        .then(response => {
          this.panels = response.body.data;
        });
    },
  }
};
</script>