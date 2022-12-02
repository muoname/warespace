<template>
    <div>
        
    </div>
</template>
<script>

export default {

    data(){
        return {
            sessions: [],
        }
    },
    created(){
        this.axios.get('/sessions.json').then((response) => {
            console.log(response.data)
        })
    }
    
}
</script>

<style>
    
</style>