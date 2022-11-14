<template>
    <div>
        
    </div>
</template>
<script>

export default {

    data(){
        return {
            spaces: [],
        }
    },
    created(){
        this.axios.get('/spaces.json').then((response) => {
            console.log(response.data)
        })
    }
    
}
</script>

<style>
    
</style>