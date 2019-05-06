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
    submitHeaderEdit() {
      this.$Progress.start();
      this.$http.put(
        document.location.origin + "/api/headers/edit/" + this.item.id,
        { name: event.target.innerText, api_token: getApiToken() }
      ).then(response=>{
        console.log(response);
        if(response.body==="success"){
            this.$Progress.finish();
            toast("Header is Updated Successfully","success");
          }else{
            this.$Progress.fail();
            toast("Failed To Update Header","error");
          }
      });
    },
    deleteHeader() {
      this.$Progress.start();
      this.$http.post(
        document.location.origin + "/api/headers/delete/" + this.item.id,
        { api_token: getApiToken() }
      ).then(response=>{
        if(response.body==="success"){
            this.$Progress.finish();
            toast("Header is Deleted Successfully","success");
            this.$emit("deleteHeaderEvent", this.index);
          }else{
            this.$Progress.fail();
            toast("Failed To Delete Header","error");
          }
      });
    }
  }
};
</script>