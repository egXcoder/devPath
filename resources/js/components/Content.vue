<template>
    <div class="content">
        <pre><code @blur="submitContentEdit()" :class="returnClass" contenteditable v-html="content"></code></pre>
        <a @click="deleteContent()">x</a>
    </div>
</template>

<script>
    import panel_header from './Header.vue';
    export default {
        data(){
            return{
                content:'',
            }
        },
        created(){
            this.content = this.item.name;
        },
        mounted() {
            Prism.highlightAll();
            },
        updated(){
            Prism.highlightAll();
        },
        computed:{
            returnClass(){
                return this.item.code_lang;
            },
        },
        props:{
            item:Object,
            index:Number,
        },
        methods: {
            submitContentEdit() {
               let newText = event.target.innerText;
               this.$http.put("http://127.0.0.1:8000/api/contents/edit/"+this.item.id,{content:newText});
               this.content = newText;
            },
            deleteContent(){
                this.$http.delete("http://127.0.0.1:8000/api/contents/delete/"+this.item.id);
                this.$emit("deleteContentEvent",this.index);
            }
            
        }
    }
</script>