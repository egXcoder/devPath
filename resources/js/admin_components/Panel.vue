<template>
  <div id="panel" class="col-md-6 col-lg-4 p-3">
    <div class="panel">
      <slot name="panelTitle"></slot>

      <div class="panel-inner mt-4">
        <component
          @deleteContentEvent="deleteContent($event)"
          @deleteHeaderEvent="deleteHeader($event)"
          v-for="(item, index) in panel.headersAndContents"
          :item="item"
          :key="index"
          :index="index"
          :is="item.type"
        ></component>

        <div class="row justify-content-between mt-2">
          <div @click="createHeader()" class="btn btn-primary">Add Header</div>
          <div @click="createContent()" class="btn btn-primary">Add Content</div>
        </div>
      </div>
    </div>
    <slot name="deletePanel"></slot>
  </div>
</template>

<script>
import panel_header from "./Header.vue";
import panel_content from "./Content.vue";

export default {
  props: {
    panel: Object,
  },
  components: {
    panel_header,
    panel_content,
  },
  methods: {
    async createHeader() {
      var header_id;

      await window.axios.post(`/api/${this.panel.id}/headers/create`).then((response) => {
        header_id = response.body.id;
      });

      let highestOrder = this.panel.headersAndContents.slice(-1).pop().order;
      window.toastr.success("Header created successfully");
      this.panel.headersAndContents.push({
        id: header_id,
        name: "default Header Name",
        order: highestOrder + 1,
        type: "panel_header",
      });
    },
    async createContent() {
      var content_id;

      await window.axios
        .post(base_path() + "/api/" + this.panel.id + "/contents/create", {})
        .then((response) => {
          content_id = response.body.id;
        });

      let highestOrder = this.panel.headersAndContents.slice(-1).pop().order;
      window.toastr.success("Content created successfully");
      this.panel.headersAndContents.push({
        id: content_id,
        name: "default content",
        order: highestOrder + 1,
        type: "panel_content",
        code_lang: "language-css",
      });
    },
    deleteHeader(index) {
      this.panel.headersAndContents.splice(index, 1);
    },
    deleteContent(index) {
      this.panel.headersAndContents.splice(index, 1);
    },
  },
};
</script>

<style scoped>
.panel {
  cursor: move;
}
.panel-inner {
  cursor: auto;
}
</style>
