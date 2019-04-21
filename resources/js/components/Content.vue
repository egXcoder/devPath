<template>
    <div class="content">
        <pre><code @focusin="showSave=true" @focusout="showSave=false" ref="content" contenteditable="true" class="language-js">
        $(document).ready(function(){
        $(".demo").click(function(){
        $(this).hide(200);
        });
        });
        </code></pre>
        <a v-show="showSave" @click="submitContentEdit">Save</a>
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
        methods: {
            submitContentEdit() {
                this.$refs.content.blur();
                this.showSave = false;
                console.log('submit Content is called');
            }
        }
    }
</script>