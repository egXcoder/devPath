<template>
  <div class="container">
        <vue-progress-bar class="progress"></vue-progress-bar>

      <div class="col-md-12 head">
        <img width="70px" :src="category.image_url">
        <h1>{{category.name}} CheatSheet</h1>
      </div>
      <draggable @change="onMove" v-model="panels" class="row">
        <template v-for="panel in panels">
          <transition :key="panel.id" name="fade">
            <panel :key="panel.id" :panel="panel">
              <div slot="panelTitle" class="panel-title">
                <h1
                  contenteditable="true"
                  @blur="editPanel(panel)"
                  @keypress.enter.prevent="editPanel(panel)"
                >{{panel.name}}</h1>
              </div>
              <p slot="deletePanel" @click="deletePanel(panel)" class="delete-box">x</p>
            </panel>
          </transition>
        </template>
      </draggable>
      
      <div class="col-md-4 p-2">
        <div v-on:click="addPanel()" class="add-box">
          <div class="btn btn-primary">+</div>
        </div>
      </div>
    </div>
</template>

<script>
import draggable from 'vuedraggable';
import panel from './Panel';
export default {
  data() {
    return {
      showDeleteBox: false,
      panels: []
    };
  },
  created() {
    this.fetchPanels();
  },
  props:{
    category:Object
  },
  components: {
    panel,
    draggable,
  },
  methods: {
    fetchPanels() {
      this.$Progress.start();
      this.$http
        .get(
          document.location.origin +
            "/api/" +
            this.category.name +
            "/panels"
        )
        .then(response => {
          // this.$Progress.finish()
          this.panels = response.body.data;
          this.$Progress.finish();

        });
    },
    async addPanel() {
      this.$Progress.start();

      await this.$http.post(
        document.location.origin +
          "/api/" +
          this.category.name +
          "/panels/create",
        { api_token: getApiToken() }
      );
      this.$Progress.finish();
      toast("panel Created Successfully");
      this.fetchPanels();
    },
    async deletePanel(panel) {
      this.$Progress.start();
      await this.$http.post(
        document.location.origin + "/api/panels/delete/" + panel.id,
        { api_token: getApiToken() }
      );
      this.$Progress.finish();
      toast("panel Deleted Successfully");
      this.fetchPanels();
    },
    async editPanel(panel) {
      this.$Progress.start();
      await this.$http.put(
        document.location.origin + "/api/panels/edit/" + panel.id,
        {
          name: event.target.innerText,
          api_token: getApiToken(),
        }
      );
      this.$Progress.finish();
      toast("panel updated Successfully");
    },
    async onMove({moved}){
      this.$Progress.start();
      await this.$http.put(
        document.location.origin + "/api/"+this.category.name+"/panels/editOrder/",
        {
          oldIndex: moved.oldIndex,
          newIndex: moved.newIndex,
          api_token: getApiToken(),
        }
      );
      this.$Progress.finish();
      toast("panel updated Successfully");
    }
  }
};
</script>
<style scoped>
.panel-title{
  cursor:auto;
}
</style>
