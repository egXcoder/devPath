<template>
  <div id="panel" class="col-md-6 col-lg-4 p-3">
    <div class="panel">
      <slot name="panelTitle"></slot>

      <div class="panel-inner mt-4">
        <component
          @deleteItem="deleteItem($event)"
          v-for="(item, index) in headersAndContents"
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
    headersAndContents: {
      type: Array,
      required: true,
    },
    id: {
      type: Number,
      required: true,
    },
  },
  components: {
    panel_header,
    panel_content,
  },
  methods: {
    createHeader() {
      window.axios.post(`/api/${this.id}/headers/create`).then((response) => {
        let highestOrder = this.headersAndContents.slice(-1).pop().order;
        let newHeadersAndContents = this.headersAndContents.concat([
          {
            id: response.data.id,
            name: "default Header Name",
            order: highestOrder + 1,
            type: "panel_header",
          },
        ]);

        this.$emit("update:headersAndContents", newHeadersAndContents);
        window.toastr.success("Header created successfully");
      });
    },
    createContent() {
      window.axios.post(`/api/${this.id}/contents/create`).then((response) => {
        let highestOrder = this.headersAndContents.slice(-1).pop().order;
        let newHeadersAndContents = this.headersAndContents.concat([
          {
            id: response.data.id,
            name: "default content",
            order: highestOrder + 1,
            type: "panel_content",
            code_lang: "language-css",
          },
        ]);

        this.$emit("update:headersAndContents", newHeadersAndContents);

        window.toastr.success("Content created successfully");
      });
    },
    deleteItem(index) {
      let newHeadersAndContents = [...this.headersAndContents];
      newHeadersAndContents.splice(index, 1);
      this.$emit("update:headersAndContents", newHeadersAndContents);
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
