<template>
  <div class="container">
      <div class="col-md-12 head">
        <img width="70px" :src="$shared.category_image">
        <h1>{{$shared.category_title}} CheatSheet</h1>
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
  components: {
    panel,
    draggable,
  },
  methods: {
    fetchPanels() {
      this.$http
        .get(
          document.location.origin +
            "/api/" +
            this.$shared.category_title +
            "/panels"
        )
        .then(response => {
          this.panels = response.body.data;
        });
    },
    async addPanel() {
      await this.$http.post(
        document.location.origin +
          "/api/" +
          this.$shared.category_title +
          "/panels/create",
        { api_token: this.$shared.api_token }
      );
      toast("panel Created Successfully");
      this.fetchPanels();
    },
    async deletePanel(panel) {
      await this.$http.post(
        document.location.origin + "/api/panels/delete/" + panel.id,
        { api_token: this.$shared.api_token }
      );
      toast("panel Deleted Successfully");
      this.fetchPanels();
    },
    async editPanel(panel) {
      await this.$http.put(
        document.location.origin + "/api/panels/edit/" + panel.id,
        {
          name: event.target.innerText,
          api_token: this.$shared.api_token
        }
      );
      toast("panel updated Successfully");
    },
    async onMove({moved}){
      await this.$http.put(
        document.location.origin + "/api/"+this.$shared.category_title+"/panels/editOrder/",
        {
          oldIndex: moved.oldIndex,
          newIndex: moved.newIndex,
          api_token: this.$shared.api_token
        }
      );
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
