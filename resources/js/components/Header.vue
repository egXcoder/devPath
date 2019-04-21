<template>
    <div class="header d-flex justify-content-between">
        <p ref="header" @keypress.enter.prevent="submitHeaderEdit" contenteditable="true">&nbsp Header is
            here
        </p>
    </div>
</template>

<script>
    export default {
        data() {
            return {

            }
        },
        methods: {
            submitHeaderEdit() {
                this.$refs.header.blur();
                console.log('method is called');
            },
        }
    }
</script>