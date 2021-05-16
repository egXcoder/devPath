<template>
  <div id="panel" class="col-md-6 col-lg-4 mb-2 p-1">
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
    <div class="actions">
      <p @click="$emit('duplicate-panel')" class="duplicate-box">
        <i class="fas fa-clone"></i>
      </p>
      <p @click="$emit('delete-panel')" class="delete-box">
        <i class="fas fa-times"></i>
      </p>
    </div>
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

<style scoped lang="scss">
#panel {
  .panel {
    cursor: move;
    .panel-inner {
      cursor: auto;
    }
  }
  .actions {
    display: flex;
    position: absolute;
    top: 10px;
    right: 10px;
    opacity: 0;
    transition: opacity 0.3s;
    .delete-box {
      cursor: pointer;
      background: #e03535;
      color: white;
      padding: 0.2rem 0.5rem;
      margin-left: 5px;
      margin-right: 5px;
      font-weight: bold;
      border-radius: 4px;
      p {
        margin-bottom: 0;
      }
    }
    .duplicate-box {
      cursor: pointer;
      background: #354fe0;
      color: white;
      padding: 0.2rem 0.5rem;
      font-weight: bold;
      border-radius: 4px;
      margin-left: 5px;
      margin-right: 5px;
      p {
        margin-bottom: 0;
      }
    }
  }
  &:hover .actions {
    opacity: 1;
  }
}
</style>
