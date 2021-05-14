<template>
  <div class="container-fluid">
    <vue-progress-bar class="progress"></vue-progress-bar>

    <div class="col-md-12 head">
      <img width="100px" :src="category.image_url" />
      <h1>{{ category.name }} Path</h1>
    </div>
    <draggable @change="onMove" v-model="$store.state.categoryPanels[category.name]" class="row">
      <template v-for="panel in $store.getters.panels(category.name)">
        <transition :key="panel.id" name="fade">
          <panel :key="panel.id" :panel="panel">
            <div slot="panelTitle" class="panel-title">
              <h1
                contenteditable="true"
                @blur="editPanel(panel)"
                @keypress.enter.prevent="editPanel(panel)"
              >
                {{ panel.name }}
              </h1>
            </div>
            <p slot="deletePanel" @click="deletePanel(panel)" class="delete-box">
              <i class="fas fa-times"></i>
            </p>
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
import draggable from "vuedraggable";
import panel from "./Panel";
export default {
  data() {
    return {
      showDeleteBox: false,
      panels: [],
      loader: {},
    };
  },
  created() {
    this.fetchPanels();
  },
  props: {
    category: Object,
  },
  components: {
    panel,
    draggable,
  },
  methods: {
    fetchPanels() {
      this.showProgress();
      this.showLoader();
      if (!this.$store.getters.panels(this.category.name)) {
        this.$store.dispatch("fetchPanels", this.category.name).then(() => {
          this.hideProgress();
          this.hideLoader();
        });
      }
    },
    addPanel() {
      this.showProgress();
      window.axios
        .post(`/api/${this.category.name}/panels/create`)
        .then((response) =>
          this.handleResponse(response, "Panel Created Successfully", "Couldnt Create Panel")
        );
    },
    deletePanel(panel) {
      this.showProgress();
      window.axios
        .post(`/api/panels/delete/${panel.id}`)
        .then((response) =>
          this.handleResponse(response, "Panel Deleted Successfully", "Couldnt Delete Panel")
        );
    },
    editPanel(panel) {
      this.$Progress.start();
      window.axios
        .post(`/api/panels/edit/${panel.id}`, {
          name: window.event.target.innerText,
        })
        .then((response) =>
          this.handleResponse(response, "Panel Updated Successfully", "Failed to Update Panel")
        );
    },
    onMove({ moved }) {
      this.$Progress.start();
      window.axios
        .post(`/api/${this.category.name}/panels/editOrder`, {
          oldIndex: moved.oldIndex,
          newIndex: moved.newIndex,
        })
        .then((response) =>
          this.handleResponse(response, "Panel Moved Successfully", "Failed to Move Panel")
        );
    },
    handleResponse(response, msgOnSuccess, msgOnFailure) {
      if (response.data === "success") {
        this.hideProgress();
        toast(msgOnSuccess, "success");
        this.$store.dispatch("fetchPanels", this.category.name);
      } else {
        this.$Progress.fail();
        toast(msgOnFailure, "error");
      }
    },
    showProgress() {
      this.$Progress.start();
    },
    hideProgress() {
      this.$Progress.finish();
    },
    showLoader() {
      this.loader = this.$loading.show({
        // Pass props by their camelCased names
        container: this.$refs.loadingContainer,
        canCancel: true, // default false
        color: "#2f6575",
        loader: "bars",
        width: 128,
        height: 128,
        backgroundColor: "#ffffff",
        opacity: 0.5,
        zIndex: 999,
      });
    },
    hideLoader() {
      this.loader.hide();
    },
  },
};
</script>

<style scoped lang="scss">
</style>
