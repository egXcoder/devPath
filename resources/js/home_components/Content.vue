<template>
    <div class="content">
        <pre><code :class="code_lang" v-html="content"></code></pre>
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
        created(){
            this.content = this.item.name;
            this.selected = this.item.code_lang;
        },
        props:{
            item:Object,
            index:Number,
        },
    }
</script>