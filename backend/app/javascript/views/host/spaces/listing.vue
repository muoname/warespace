<template>
    <div class="row">
        <div class="col-4 q-pa-sm">        
        </div>
        <div class="col-8 q-pa-sm">
            <div class="row inline q-pa-md">
                <div v-for="space in spaces" class="col-3 q-pa-sm">
                    <q-card v-ripple class="md">
                        <img src="https://cdn.quasar.dev/img/mountains.jpg">
                
                        <q-card-section>
                            <div class="text-h6"> {{ space.title }}</div>
                            <div class="text-subtitle2">{{ space.user_id }}</div>
                        </q-card-section>
                
                        <q-card-section class="q-pt-none">
                            <router-link :to="{ name: 'host_show_path', params: {id: space.id}}"><q-btn flat rounded color="primary" label="Show" /></router-link>
                            
                        </q-card-section>
                    </q-card>
                </div>            
            </div>
            
        </div>        
    </div>
</template>
<script>
export default {
    data(){
        return {
            spaces: []
        }
    },
    created(){
        this.axios.get('/api/v1/spaces').then((response) => {
            this.spaces = response.data
            console.log(this.spaces)
        })
    }
}
</script>
<style>
    
</style>