<template>
  <div id="panel" class="col-lg-4 col-md-6 p-3">
    <div class="panel">
      <slot name="panel_title"></slot>

      <div class="panel-inner my-4">
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