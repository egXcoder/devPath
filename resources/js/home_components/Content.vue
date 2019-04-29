<template>
    <div class="content">
        <pre><code style="display:inline-block;width:100%" :class="code_lang">{{content}}</code></pre>
    </div>
</template>

<script>
    import panel_header from './Header.vue';
    export default {
        data(){
            return{
                content:this.item.name,
                code_lang:this.item.code_lang,
            }
        },
        mounted(){
            Prism.highlightAll();
        },
        props:{
            item:Object,
            index:Number,
        },
    }
</script>