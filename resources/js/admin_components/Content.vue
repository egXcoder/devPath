<template>
    <div class="content">
        <pre><code @blur="submitContentEdit()" :class="code_lang" contenteditable v-html="content"></code></pre>
            <div class="form-group">
                <select v-model="code_lang" class="form-control">
                    <option>language-html</option>
                    <option>language-css</option>
                    <option>language-js</option>
                    <option>language-php</option>
                </select>
            </div>
        <a @click="deleteContent">x</a>
    </div>
</template>

<script>
    import panel_header from './Header.vue';
    export default {
        data(){
            return{
                content:'',
                code_lang:this.item.code_lang,
            }
        },
        watch:{
            code_lang:function(value){
                this.$http.put(document.location.origin+"/api/contents/edit/"+this.item.id,{code_lang:value,api_token:this.$shared.api_token});
                this.code_lang = value;
                toast('Code language is updated Successfully');
                Prism.highlightAll();
            },
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
        props:{
            item:Object,
            index:Number,
        },
        methods: {
            submitContentEdit() {
               let newText = event.target.innerText;
               this.$http.put(document.location.origin+"/api/contents/edit/"+this.item.id,{content:newText,api_token:this.$shared.api_token});
               this.content = newText;
               toast('Content is updated Successfully');
            },
            deleteContent(){
                this.$http.post(document.location.origin+"/api/contents/delete/"+this.item.id,{api_token:this.$shared.api_token});
                this.$emit("deleteContentEvent",this.index);
               toast('Content is deleted Successfully');

            }
            
        }
    }
</script>