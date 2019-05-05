<template>
  <div class="header d-flex justify-content-between">
    <p
      @blur="submitHeaderEdit()"
      @keypress.enter.prevent="submitHeaderEdit()"
      contenteditable="true"
    >{{item.name}}</p>
    
    <a @click="deleteHeader()">x</a>
  </div>
</template>

<script>
export default {
  props: {
    item: Object,
    index: Number
  },
  methods: {
    async submitHeaderEdit() {
      await this.$http.put(
        document.location.origin + "/api/headers/edit/" + this.item.id,
        { name: event.target.innerText, api_token: this.$shared.api_token }
      );
      toast("Header is editted Successfully");
    },
    async deleteHeader() {
      await this.$http.post(
        document.location.origin + "/api/headers/delete/" + this.item.id,
        { api_token: this.$shared.api_token }
      );
      toast("Header is deleted Successfully");
      this.$emit("deleteHeaderEvent", this.index);
    }
  }
};
</script>