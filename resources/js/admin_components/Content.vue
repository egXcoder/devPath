<template>
  <div class="content">
    <pre><code 
    @mouseenter="isEditable = true" 
    :contenteditable="isEditable" 
    @blur="submitContentEdit()" 
    style="display:inline-block;width:100%;outline:none;" 
    :class="code_lang"
    spellcheck='false'
    >{{content}}</code></pre>

    <a @click="deleteContent" class="x"><i class="fas fa-times"></i></a>
    <div class="form-group">
      <select v-model="code_lang" class="form-control">
        <option>language-html</option>
        <option>language-css</option>
        <option>language-js</option>
        <option>language-php</option>
        <option>language-sql</option>
      </select>
    </div>
  </div>
</template>

<script>
import Prism from "../../../public/css/plugins/prism/prism";

export default {
  data() {
    return {
      isEditable: false,
      content: this.item.name,
      code_lang: this.item.code_lang,
    };
  },
  props: {
    item: Object,
    index: Number,
  },
  watch: {
    code_lang(value) {
      window.axios.post(`/api/contents/edit/${this.item.id}`, { code_lang: value }).then(() => {
        this.code_lang = value;
        window.toastr.success("Code language is updated Successfully");
        //highlight with prism when code_lang changed
        Prism.highlightAll();
      });
    },
  },
  mounted() {
    //highlight with prism when content visible to screen
    Prism.highlightAll();
  },
  methods: {
    submitContentEdit() {
      this.$Progress.start();
      let newText = event.target.innerText;
      this.content = newText;
      Prism.highlightAll();
      window.axios
        .post(`/api/contents/edit/${this.item.id}`, { content: newText })
        .then((response) => {
          if (response.data === "success") {
            this.$Progress.finish();
            window.toastr.success("Content is Updated Successfully");
          } else {
            this.$Progress.fail();
            window.toastr.error("Failed To Update Content");
          }
        });
      this.isEditable = false;
    },
    deleteContent() {
      this.$Progress.start();
      window.axios.post(`/api/contents/delete/${this.item.id}`, {}).then((response) => {
        if (response.data === "success") {
          this.$Progress.finish();
          window.toastr.success("Content is Deleted Successfully");
          this.$emit("deleteItem", this.index);
        } else {
          this.$Progress.fail();
          window.toastr.error("Failed To Delete Content");
        }
      });
    },
  },
};
</script>