<template>
  <div id="panel" class="col-md-4 p-2">
    <div class="panel">
      <slot name="panelTitle"></slot>

      <div class="panel-inner my-4">
        
          <component
            @deleteContentEvent="deleteContent($event)"
            @deleteHeaderEvent="deleteHeader($event)"
            v-for="(item,index) in headersAndContents"
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
  data() {
    return {
      headersAndContents: []
    };
  },
  props: {
    panel: Object
  },
  components: {
    panel_header,
    panel_content,
  },
  created() {
    this.headersAndContents = this.panel.headersAndContents;
  },

  methods: {
    async createHeader() {
      await this.$http.post(
        document.location.origin +
          "/api/" +
          this.$shared.category_title +
          "/" +
          this.panel.name +
          "/headers/create",
        { api_token: this.$shared.api_token }
      );
      let highestOrder = this.headersAndContents.slice(-1).pop().order;
      toast("Header created successfully");
      this.headersAndContents.push({
        name: "default Header Name",
        order: highestOrder + 1,
        type: "panel_header"
      });
    },
    async createContent() {
      await this.$http.post(
        document.location.origin +
          "/api/" +
          this.$shared.category_title +
          "/" +
          this.panel.name +
          "/contents/create",
        { api_token: this.$shared.api_token }
      );
      let highestOrder = this.headersAndContents.slice(-1).pop().order;
      toast("Content created successfully");
      this.headersAndContents.push({
        name: "default content",
        order: highestOrder + 1,
        type: "panel_content",
        code_lang: "language-css"
      });
    },
    deleteHeader(index) {
      this.headersAndContents.splice(index, 1);
    },
    deleteContent(index) {
      this.headersAndContents.splice(index, 1);
    }
  }
};
</script>