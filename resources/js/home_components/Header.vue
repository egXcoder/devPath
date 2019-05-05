<template>
    <div class="header d-flex justify-content-between">
        <p>{{item.name}}</p>
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