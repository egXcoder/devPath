<template>
    <div class="header d-flex">
        <span></span>
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