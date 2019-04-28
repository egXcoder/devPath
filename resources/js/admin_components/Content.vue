<template>
    <div class="content">
        <pre><code @blur="submitContentEdit()" :class="code_lang" contenteditable v-html="content"></code></pre>
            <div class="form-group">
                <select v-model="selected" class="form-control">
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
                selected:'',
                code_lang:this.item.code_lang,
            }
        },
        watch:{
            selected:function(value){
                this.$http.put(this.$shared.siteUrl+"/api/contents/edit/"+this.item.id,{code_lang:value,Authorization:'Bearer '+this.$shared.api_token});
                this.code_lang = value;
                Prism.highlightAll();
            },
        },
        created(){
            this.content = this.item.name;
            this.selected = this.item.code_lang;
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
               this.$http.put(this.$shared.siteUrl+"/api/contents/edit/"+this.item.id,{content:newText,Authorization:'Bearer '+this.$shared.api_token});
               this.content = newText;
            },
            deleteContent(){
                this.$http.post(this.$shared.siteUrl+"/api/contents/delete/"+this.item.id,{api_token:this.$shared.api_token});
                this.$emit("deleteContentEvent",this.index);
            }
            
        }
    }
</script>