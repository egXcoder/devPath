<template>
  <div class="all-panels">
    <sidebar></sidebar>
    <div class="container-fluid">
      <vue-progress-bar class="progress"></vue-progress-bar>

      <div class="col-md-12 head">
        <img width="100px" :src="category.image_url" />
        <h1>{{ category.name }} Path</h1>
      </div>
      <draggable @change="onMove" class="row" v-model="panels">
        <template v-for="panel in panels">
          <panel :key="panel.id" :headersAndContents.sync="panel.headersAndContents" :id="panel.id">
            <div slot="panelTitle" class="panel-title">
              <h1
                contenteditable="true"
                @blur="editPanel(panel)"
                @keypress.enter.prevent="editPanel(panel)"
              >
                {{ panel.name }}
              </h1>
            </div>
            <p slot="deletePanel" @delete-panel="deletePanel(panel)" class="delete-box">
              <i class="fas fa-times"></i>
            </p>
          </panel>
        </template>
      </draggable>

      <div class="add-box" v-on:click="addPanel()">
        <div class="btn btn-primary rounded-circle"><i class="fas fa-plus"></i></div>
      </div>
    </div>
  </div>
</template>

<script>
import draggable from "vuedraggable";
import panel from "./Panel";
import Sidebar from "../admin_components/Sidebar";

export default {
  components: {
    panel,
    draggable,
    Sidebar,
  },
  data() {
    return {
      showDeleteBox: false,
      loader: null,
    };
  },
  computed: {
    category() {
      let category = this.$store.state.categoryPanels[this.$route.params.category];
      return category ? category : {};
    },
    panels: {
      get() {
        return this.category.panels;
      },
      set(newValue) {
        this.$set(
          this.$store.state.categoryPanels[this.$route.params.category],
          "panels",
          newValue
        );
      },
    },
  },
  watch: {
    $route: {
      immediate: true,
      handler() {
        this.showLoader();

        if (this.isPanelsAlreadyExistsOnVuex()) {
          return this.afterPanelLoaded();
        }

        this.$store.dispatch("fetchPanels", this.$route.params.category).then(() => {
          this.afterPanelLoaded();
        });
      },
    },
  },
  methods: {
    showLoader() {
      if (!this.loader) {
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
      }
    },
    isPanelsAlreadyExistsOnVuex() {
      return this.$store.getters.panels(this.$route.params.category);
    },
    afterPanelLoaded() {
      this.$nextTick(this.initializeGrid);
    },
    initializeGrid() {
      if (this.loader) {
        this.loader.hide();
        this.loader = null;
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
    duplicatePanel(panel) {
      this.showProgress();
      window.axios
        .post(`/api/panels/duplicate/${panel.id}`)
        .then((response) =>
          this.handleResponse(response, "Panel Duplicated Successfully", "Couldnt Duplicate Panel")
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
        window.toastr.success(msgOnSuccess);
        this.$store.dispatch("fetchPanels", this.category.name);
      } else {
        this.$Progress.fail();
        window.toastr.error(msgOnFailure);
      }
    },
    showProgress() {
      this.$Progress.start();
    },
    hideProgress() {
      this.$Progress.finish();
    },
    hideLoader() {
      this.loader.hide();
    },
  },
};
</script>

<style scoped lang="scss">
.all-panels {
  .head {
    margin: 2rem 0rem;
    text-align: center;
  }
}
</style>
