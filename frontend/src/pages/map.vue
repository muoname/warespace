<template>
        <q-page>
                <GMapMap  :center="center"
                    :options="options" :zoom="13" style="width: 100vw; height: 900px">
                    <GMapMarker v-bind:key="space.id" v-for="space in nearby" 
                    :position="{lat: space.latitude, lng: space.longitude}">

                    </GMapMarker>
                </GMapMap>
        </q-page>
</template>
<script>
import "../store/index.js"
import { useStore } from "vuex"
import axios from "axios"
export default {
    created(){
        const store = useStore()
        const address = store.getters.getUserAddress
        axios.get(`http://localhost:3000/api/v1/maps/nearby/${address}`).then((response) => {
            this.nearby = response.data
        })
    },
    data(){
        return {
            nearby: [],
            options: { 
                styles: [
                    {
                        "featureType": "administrative",
                        "elementType": "geometry",
                        "stylers": [
                            {
                                "visibility": "off"
                            }
                        ]
                    },
                    {
                        "featureType": "poi",
                        "stylers": [
                            {
                                "visibility": "off"
                            }
                        ]
                    },
                    {
                        "featureType": "road",
                        "elementType": "labels.icon",
                        "stylers": [
                            {
                                "visibility": "off"
                            }
                        ]
                    },
                    {
                        "featureType": "transit",
                        "stylers": [
                            {
                                "visibility": "off"
                            }
                        ]
                    }
                ]
                   
            },

        }
    },
    setup(){


        const store = useStore()
        const center = { lat: store.getters.getLat , lng: store.getters.getLng }
        
        return {
            center,
        }
    }
}
</script>
<style lang="">
    
</style>