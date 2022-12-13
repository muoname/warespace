<template>
    <div class="row justify-center flex center">
        <div class="col">
            <q-carousel animated v-model="slide" navigation infinite :autoplay="autoplay" arrows control-color="primary"
                transition-prev="slide-right" transition-next="slide-left" @mouseenter="autoplay = false"
                @mouseleave="autoplay = true">
                <q-carousel-slide :name="1">
                    <div class="row q-pa-md flex-center justify-between">
                        <div class="col-4 q-pl-lg q-pr-lg" v-for="space in spaces" v-bind:key="space.id">
                            <q-card class="my-card">
                                <q-card-section horizontal>
                                    <q-img class="col-5" :src="space.image.url" />
                                    
                                    <q-card-section>
                                        {{ space.description }}
                                    </q-card-section>
                                </q-card-section>
                            
                                <q-separator />
                            
                                <div class="row flex-center justify-between q-pa-sm">
                                    <div class="col q-pr-sm gt-sm" align="right">
                                        <q-btn flat dense round icon="event" />
                                        <router-link :to="{ name: 'host_show_path', params: { id: space.id } }">
                                            <q-btn flat dense color="primary">
                                                Reserve
                                            </q-btn>
                                        </router-link>
                                        
                                    </div>
                                    <div class="col q-pr-sm lt-md" align="center">
                                        <q-btn flat dense round icon="event" />
                                        <q-btn flat dense color="primary">
                                            Reserve
                                        </q-btn>
                                    </div>
                                </div>
                            </q-card>
                        </div>
                    </div>
                </q-carousel-slide>
                <q-carousel-slide :name="2">
                    <div class="row q-pa-md flex-center justify-between">
                        <div class="col-4 q-pl-lg q-pr-lg" v-for="space in spaces2" v-bind:key="space.id">
                            <q-card class="my-card">
                                <q-card-section horizontal>
                                    <q-img class="col-5" :src="space.image.url" />
                        
                                    <q-card-section>
                                        {{ space.description }}
                                    </q-card-section>
                                </q-card-section>
                        
                                <q-separator />
                        
                                <div class="row flex-center justify-between q-pa-sm">
                                    <div class="col q-pr-sm gt-sm" align="right">
                                        <q-btn flat dense round icon="event" />
                                        <router-link :to="{ name: 'host_show_path', params: { id: space.id } }">
                                            <q-btn flat dense color="primary">
                                                Reserve
                                            </q-btn>
                                        </router-link>
                        
                                    </div>
                                    <div class="col q-pr-sm lt-md" align="center">
                                        <q-btn flat dense round icon="event" />
                                        <q-btn flat dense color="primary">
                                            Reserve
                                        </q-btn>
                                    </div>
                                </div>
                            </q-card>
                        </div>
                    </div>
                </q-carousel-slide>
            </q-carousel>
        </div>
    </div>
</template>

<script>
import { ref } from 'vue'
import axios from 'axios'
export default {
    created() {
        axios.get(`http://localhost:3000/api/v1/recommendation`,).then((response) => {
            this.spaces = response.data
        })
        axios.get(`http://localhost:3000/api/v1/recommendation2`,).then((response) => {
            this.spaces2 = response.data
        })
    }, 
    data() {
        return{
            spaces: [],
            spaces2: []
        }
    },
    setup() {
        return {
            slide: ref(1),
            autoplay: ref(true),
        }
    }

}
</script>

<style>
</style>