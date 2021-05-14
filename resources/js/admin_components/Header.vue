<template>
  <div class="header d-flex">
    <span></span>
    <p
      @blur="submitHeaderEdit()"
      @keypress.enter.prevent="submitHeaderEdit()"
      contenteditable="true"
    >
      {{ item.name }}
    </p>

    <a @click="deleteHeader()" class="x"><i class="fas fa-times"></i></a>
  </div>
</template>

<script>
export default {
  props: {
    item: Object,
    index: Number,
  },
  methods: {
    submitHeaderEdit() {
      this.$Progress.start();
      window.axios
        .post(`/api/headers/edit/${this.item.id}`, { name: window.event.target.innerText })
        .then((response) => {
          if (response.data === "success") {
            this.$Progress.finish();
            window.toastr.success("Header is Updated Successfully");
          } else {
            this.$Progress.fail();
            window.toastr.error("Failed To Update Header");
          }
        });
    },
    deleteHeader() {
      this.$Progress.start();
      window.axios.post(`/api/headers/delete/${this.item.id}`).then((response) => {
        if (response.data === "success") {
          this.$Progress.finish();
          window.toastr.success("Header is Deleted Successfully");
          this.$emit("deleteHeaderEvent", this.index);
        } else {
          this.$Progress.fail();
          window.toastr.error("Failed To Delete Header");
        }
      });
    },
  },
};
</script>