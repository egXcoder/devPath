<template>
    <div class="header d-flex justify-content-between">
        <p>&nbsp {{item.name}}
        </p>
    </div>
</template>

<script>
    export default {
        props:{
            item:Object,
            index:Number,
        },
    }
</script>