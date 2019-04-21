<template>
    <div class="col-md-4 p-2">
        <div class="panel">
            <div class="panel-title">{{panel_title}}</div>
            <div class="panel-inner my-4">

                <panel_header></panel_header>
                <panel_content></panel_content>
                <panel_header></panel_header>
                <panel_content></panel_content>

                <panel_content></panel_content>

            </div>
        </div>
    </div>
</template>

<script>
    import panel_header from './Header.vue';
    import panel_content from './Content.vue';
    export default {
        data(){
            return{
                panel_title: 'JQuery',
            }
        },
        components: {
            panel_header,
            panel_content,
        },
        // methods: {
        //     submitHeaderEdit() {
        //         this.$refs.header.blur();
        //         console.log('method is called');
        //     },
        //     submitContentEdit() {
        //         this.$refs.content.blur();
        //         this.showSave = false;
        //         console.log('submit Content is called');
        //     }
        // }
    }
</script>