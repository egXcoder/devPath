<template>
    <div id="panel" class="col-md-4 p-2">
        <div class="panel">
            
            <div class="panel-title" 
            ref="panelTitle" 
            @keypress.enter.prevent="triggerBlur()" 
            contenteditable="true">
            <h1 class="lead">{{panel.name}}</h1>
            </div>
            
            <div class="panel-inner my-4">
                <component v-for="(item,index) in headersAndContents_List" :key="index" :is="item.type"></component>
            </div>
        </div>
        <slot></slot>
    </div>
</template>

<script>
    import panel_header from './Header.vue';
    import panel_content from './Content.vue';
    export default {
        data(){
            return{
                headersAndContents_List:[],
            }
        },
        props:{
            panel:Object
        },
        components: {
            panel_header,
            panel_content,
        },
        created(){
            this.createListForheadersAndContents();
        },
        mounted(){
            $(this.$refs.panelTitle).on("blur",function(){
                // submit title 
                console.log('submit title');
                });
        },
        methods:{
            createListForheadersAndContents(){
                this.panel.headers.forEach(element => {
                this.headersAndContents_List.push({'name':element['name'],'type':element['type'],'order':element['order']})
                });
                this.panel.contents.forEach(element => {
                    this.headersAndContents_List.push({'name':element['content'],'type':element['type'],'order':element['order']})
                });
                // sort headers and contents headersAndContents_List with their order ascending
                this.headersAndContents_List.sort(function(a,b){
                    if(a.order<b.order) return -1; 
                    if(a.order>b.order) return 1; 
                    if(a.order==b.order) return 0; 
                });
            },
            triggerBlur(){
                this.$refs.panelTitle.blur();
            },
        }
    }
</script>