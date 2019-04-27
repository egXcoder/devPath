<template>
    <div class="header d-flex justify-content-between">
        <p @blur="submitHeaderEdit()" @keypress.enter.prevent="submitHeaderEdit()" contenteditable="true">&nbsp {{item.name}}
        </p>
        <a @click="deleteHeader()">x</a>
    </div>
</template>

<script>
    import {Shared} from './../app.js';
    export default {
        props:{
            item:Object,
            index:Number,
        },
        methods: {
            submitHeaderEdit() {
                this.$http.put(this.$shared.siteUrl+"/api/headers/edit/"+this.item.id,{name:event.target.innerText});
            },
            deleteHeader(){
                this.$http.delete(this.$shared.siteUrl+"/api/headers/delete/"+this.item.id);
                this.$emit("deleteHeaderEvent",this.index);
            }
        }
    }
</script>