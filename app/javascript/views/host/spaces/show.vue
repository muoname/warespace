<template>
    <div>
        
    </div>
</template>
<script>
export default {
    created() {

        this.axios.get(`/api/v1/spaces/${this.$route.params.id}`).then((response) => {
            console.log(response.data)
            console.log(this.$route.params.id)
        })
    }
}
</script>
<style>
    
</style>