<template>
  <div class="container-fluid">
        <vue-progress-bar class="progress"></vue-progress-bar>

      <div class="col-md-12 head">
        <img width="100px" :src="category.image_url">
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
              <p slot="deletePanel" @click="deletePanel(panel)" class="delete-box"><i class="fas fa-times"></i></p>
            </panel>
          </transition>
        </template>
      </draggable>
      
      
        <div class="add-box" v-on:click="addPanel()">
          <div class="btn btn-primary rounded-circle"><i class="fas fa-plus"></i></div>
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
      panels: [],
      loader:{},
    };
  },
  created() {
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
    draggable,
  },
  methods: {
    fetchPanels() {
      this.$Progress.start();
      this.$http
        .get(
          base_path() +
            "/api/" +
            this.category.name +
            "/panels"
        )
        .then(response => {
          this.panels = response.body.data;
          this.$Progress.finish();
          this.loader.hide();
        });
    },
   addPanel() {
      this.$Progress.start();

      this.$http.post(
        base_path() + "/api/" + this.category.name + "/panels/create", { api_token: getApiToken() }
      ).then(response=>this.handleResponse(response,"Panel Created Successfully","Failed to Create Panel"));
      
    },
    deletePanel(panel) {
      this.$Progress.start();
      this.$http.post(
        base_path() + "/api/panels/delete/" + panel.id,
        { api_token: getApiToken() }
      ).then(response=>this.handleResponse(response,"Panel Deleted Successfully","Failed to Delete Panel"));
    },
    editPanel(panel) {
      this.$Progress.start();
      this.$http.post(
        base_path() + "/api/panels/edit/" + panel.id,
        {
          name: event.target.innerText,
          api_token: getApiToken(),
        }
      ).then(response=>this.handleResponse(response,"Panel Updated Successfully","Failed to Update Panel"));
      
    },
    onMove({moved}){
      this.$Progress.start();
      this.$http.post(
        base_path()  + "/api/"+this.category.name+"/panels/editOrder",
        {
          oldIndex: moved.oldIndex,
          newIndex: moved.newIndex,
          api_token: getApiToken(),
        }
      ).then(response=>this.handleResponse(response,"Panel Moved Successfully","Failed to Move Panel"));
    },
    handleResponse(response,msgOnSuccess,msgOnFailure){
      if(response.body==="success"){
            this.$Progress.finish();
            toast(msgOnSuccess,"success");
            this.fetchPanels();
          }else{
            this.$Progress.fail();
            toast(msgOnFailure,"error");
          }
    }
  }
};
</script>
<style scoped>
.panel-title{
  cursor:auto;
}
</style>
