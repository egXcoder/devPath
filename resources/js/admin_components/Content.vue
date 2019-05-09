<template>
    <div class="content">
        <pre><code @mouseenter="isEditable = true" :contenteditable="isEditable" @blur="submitContentEdit()" style="display:inline-block;width:100%;outline:none;" :class="code_lang">{{content}}</code></pre>
            <div class="form-group">
                <select v-model="code_lang" class="form-control">
                    <option>language-html</option>
                    <option>language-css</option>
                    <option>language-js</option>
                    <option>language-php</option>
                    <option>language-sql</option>
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
                isEditable:false,
                content:this.item.name,
                code_lang:this.item.code_lang,
            }
        },
        props:{
            item:Object,
            index:Number,
        },
        watch:{
            async code_lang(value){
                await this.$http.put(document.location.origin+"/api/contents/edit/"+this.item.id,{code_lang:value,api_token:getApiToken()});
                this.code_lang = value;
                toast('Code language is updated Successfully');
                //highlight with prism when code_lang changed
                Prism.highlightAll();
            },
        },
        mounted() {
            //highlight with prism when content visible to screen
            Prism.highlightAll();
            },
        methods: {
            submitContentEdit() {
               this.$Progress.start();
               let newText = event.target.innerText;
               this.content = newText;
               Prism.highlightAll();
               this.$http.put(document.location.origin+"/api/contents/edit/"+this.item.id,{content:newText,api_token:getApiToken()})
               .then(response=>{
                    if(response.body==="success"){
                        this.$Progress.finish();
                        toast("Content is Updated Successfully","success");
                    }else{
                        this.$Progress.fail();
                        toast("Failed To Update Content","error");
                    }
                });
               this.isEditable = false;
            },
            deleteContent(){
                this.$Progress.start();
                this.$http.post(document.location.origin+"/api/contents/delete/"+this.item.id,{api_token:getApiToken()})
                .then(response=>{
                    if(response.body==="success"){
                        this.$Progress.finish();
                        toast("Content is Deleted Successfully","success");
                        this.$emit("deleteContentEvent",this.index);
                    }else{
                        this.$Progress.fail();
                        toast("Failed To Delete Content","error");
                    }
                });
            }
            
        }
    }
</script>