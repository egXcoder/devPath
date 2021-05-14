<template>
  <div id="panel" class="col-md-6 col-lg-4 mb-2 p-1">
    <div class="panel">
      <slot name="panel_title"></slot>

      <div class="panel-inner">
        <component
          v-for="(item, index) in panel.headersAndContents"
          :item="item"
          :key="index"
          :index="index"
          :is="item.type"
        ></component>
      </div>
    </div>
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
};
</script>