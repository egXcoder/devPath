<template>
  <div id="panel" class="col-lg-4 col-md-6 p-3">
    <div class="panel">
      <slot name="panelTitle"></slot>

      <div class="panel-inner my-4">
        <component @deleteContentEvent="deleteContent($event)" @deleteHeaderEvent="deleteHeader($event)" v-for="(item,index) in headersAndContents" :item="item" :key="index" :index="index" :is="item.type"></component>
      </div>
    </div>
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
  },
  components: {
    panel_header,
    panel_content
  },
  created() {
    this.headersAndContents = this.panel.headersAndContents;
  },
};
</script>