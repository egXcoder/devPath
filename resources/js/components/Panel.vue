<template>
  <div id="panel" class="col-md-4 p-2">
    <div class="panel">
      <slot name="panelTitle"></slot>

      <div class="panel-inner my-4">
        <component v-for="(item,index) in headersAndContents" :key="index" :is="item.type"></component>

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
    panel: Object,
    categoryTitle:String,
  },
  components: {
    panel_header,
    panel_content
  },
  created() {
    this.headersAndContents = this.panel.headersAndContents;
  },

  methods: {
    createHeader() {
        this.$http.post("http://127.0.0.1:8000/api/"+this.categoryTitle+"/"+this.panel.name+"/headers/create");
        let highestOrder = this.headersAndContents.slice(-1).pop().order;
        this.headersAndContents.push({
        name:"default Header Name",
        order:highestOrder+1,
        type:"panel_header",
        });
    },
    createContent() {
        this.$http.post("http://127.0.0.1:8000/api/"+this.categoryTitle+"/"+this.panel.name+"/contents/create");
        let highestOrder = this.headersAndContents.slice(-1).pop().order;
    
        this.headersAndContents.push({
        code_lang:'language-css',
        name:"default content",
        order:highestOrder+1,
        type:"panel_content",
        });
    }
  }
};
</script>