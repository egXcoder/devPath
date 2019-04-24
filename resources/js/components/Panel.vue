<template>
  <div id="panel" class="col-md-4 p-2">
    <div class="panel">
      <slot name="panelTitle"></slot>

      <div class="panel-inner my-4">
        <component v-for="(item,index) in headersAndContents" :key="index" :is="item.type"></component>
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
    panel_content
  },
  created() {
    this.headersAndContents = this.panel.headersAndContents
  },

  methods: {
    
  }
};
</script>