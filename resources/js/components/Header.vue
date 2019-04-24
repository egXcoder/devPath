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
                this.$http.put("http://127.0.0.1:8000/api/headers/edit/"+this.item.id,{name:event.target.innerText});
            },
            deleteHeader(){
                this.$http.delete("http://127.0.0.1:8000/api/headers/delete/"+this.item.id);
                this.$emit("deleteHeaderEvent",this.index);
            }
        }
    }
</script>