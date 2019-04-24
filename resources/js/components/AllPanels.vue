<template>
  <div class="container">
    <div class="row">
      <div class="col-12 head">
        <h1>
          <img width="70px" src="images/cheatsheet.png"> JQuery CheatSheet
        </h1>
      </div>
      <template v-for="panel in panels">
        <panel :key="panel.id" :categoryTitle="categoryTitle" :panel="panel">
          <div slot="panelTitle" class="panel-title">
            <h1
              contenteditable="true"
              @blur="editPanel(panel)"
              @keypress.enter.prevent="editPanel(panel)"
            >{{panel.name}}</h1>
          </div>
          <p slot="deletePanel" @click="deletePanel(panel)" class="delete-box">x</p>
        </panel>
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
import panel from "./Panel";
import { Shared } from "./../app.js";

export default {
  data() {
    return {
      showDeleteBox: false,
      categoryTitle:'aut',
      panels:[],
    };
  },
  created() {
    this.fetchPanels();
  },
  components: {
    panel
  },
  methods: {
    fetchPanels() {
        this.$http
        .get("http://127.0.0.1:8000/api/" + this.categoryTitle + "/panels")
        .then(function(response) {
          this.panels = response.body.data;
        });
    },
    addPanel() {
      this.$http.post(
        "http://127.0.0.1:8000/api/" + this.categoryTitle + "/panels/create"
      );
      toast("panel Created Successfully");
      this.fetchPanels();
    },
    deletePanel(panel) {
      this.$http.delete("http://127.0.0.1:8000/api/panels/delete/" + panel.id);
      toast("panel Deleted Successfully");
      this.fetchPanels();
    },
    changePanelNameVariable() {
      console.log(this.$refs.panelTitle);
    },
    editPanel(panel) {
      this.$http.put("http://127.0.0.1:8000/api/panels/edit/" + panel.id, {
        name: event.target.innerText
      });
      toast("panel edited Successfully");
    }
  }
};
</script>