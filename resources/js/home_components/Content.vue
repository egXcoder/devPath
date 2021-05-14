<template>
  <div class="content">
    <pre><code style="display:inline-block;width:100%" :class="code_lang">{{content}}</code></pre>
  </div>
</template>

<script>
import Prism from "../../../public/css/plugins/prism/prism";

export default {
  data() {
    return {
      content: this.item.name,
      code_lang: this.item.code_lang,
    };
  },
  mounted() {
    Prism.highlightAll();
  },
  props: {
    item: Object,
    index: Number,
  },
};
</script>