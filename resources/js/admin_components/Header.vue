<template>
    <div class="header d-flex justify-content-between">
        <p @blur="submitHeaderEdit()" @keypress.enter.prevent="submitHeaderEdit()" contenteditable="true">&nbsp {{item.name}}
        </p>
        <a @click="deleteHeader()">x</a>
    </div>
</template>

<script>

    export default {
        props:{
            item:Object,
            index:Number,
        },
        methods: {
            submitHeaderEdit() {
                this.$http.put(this.$shared.siteUrl+"/api/headers/edit/"+this.item.id,{name:event.target.innerText,api_token:this.$shared.api_token});
            },
            deleteHeader(){
                this.$http.post(this.$shared.siteUrl+"/api/headers/delete/"+this.item.id,{api_token:this.$shared.api_token});
                this.$emit("deleteHeaderEvent",this.index);
            }
        }
    }
</script>