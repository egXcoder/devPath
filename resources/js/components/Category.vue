<template>
    <ul class="list-unstyled">
        <li v-for="category in categories"><a href="http://">{{category.name}}</a></li>
    </ul>
</template>

<script>
    export default {
        data(){
            return{
                categories:[], 
            }
    },
    created(){
        this.$http.get("http://127.0.0.1:8000/api/").then((response) => {
            this.categories = response.data;
        });        
    }
    }
</script>