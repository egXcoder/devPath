<template>
  <div class="container">
    <div class="row">
      <div class="col-4 head">
        <h1>
          <img width="70px" :src="$shared.category_image">
          {{$shared.category_title}} CheatSheet
        </h1>
      </div>

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
      <div class="col-md-4 p-2">
        <div v-on:click="addPanel()" class="add-box">
          <div class="btn btn-primary">+</div>
        </div>
      </div>
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
    addPanel() {
      this.$http.post(this.$shared.siteUrl + "/api/" + this.$shared.category_title + "/panels/create",{api_token:this.$shared.api_token});
      toast("panel Created Successfully");
      this.fetchPanels();
    },
    deletePanel(panel) {
      this.$http.delete(this.$shared.siteUrl + "/api/panels/delete/" + panel.id,{api_token:this.$shared.api_token});
      toast("panel Deleted Successfully");
      this.fetchPanels();
    },
    editPanel(panel) {
      this.$http.put(this.$shared.siteUrl + "/api/panels/edit/" + panel.id, {
        name: event.target.innerText,
        api_token : this.$shared.api_token,
      });
      toast("panel edited Successfully");
    }
  }
};
</script>