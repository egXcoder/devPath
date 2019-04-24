<template>
    <div class="content">
        <pre><code @blur="submitContentEdit()" contenteditable="true" class="language-js">{{item.name}}</code></pre>
        <a @click="deleteContent()">x</a>
    </div>
</template>

<script>
    import panel_header from './Header.vue';
    export default {
        data() {
            return {
                showSave: false,
            }
        },
        props:{
            item:Object,
            index:Number,
        },
        methods: {
            submitContentEdit() {
               this.$http.put("http://127.0.0.1:8000/api/contents/edit/"+this.item.id,{content:event.target.innerText});
            },
            deleteContent(){
                this.$http.delete("http://127.0.0.1:8000/api/contents/delete/"+this.item.id);
                this.$emit("deleteContentEvent",this.index);
            }
        }
    }
</script>