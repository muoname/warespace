<template>
    <q-page>
        <GMapMap :center="center" :options="options" :zoom="13" style="width: 100vw; height: 900px">
            <GMapMarker v-bind:key="space.id" v-for="space in nearby"
                :position="{ lat: space.latitude, lng: space.longitude }" @click="openMarker(space.id)">
                <GMapInfoWindow :closeclick="true" @closeclick="openMarker(null)" :opened="openedMarkerID === space.id" 
                options="{
                    maxWidth: 200,
                    maxHeight: 200,
                }">
                    <q-card v-ripple class="">
                    
                        <q-img :src="space.image.url" spinner-color="white" />
                    
                        <q-card-section>
                            <div class="text-h6">{{ space.title }}</div>
                            <div class="text-subtitle2">{{ space.user_id }}</div>
                        </q-card-section>
                    
                        <div class="row flex-center">
                            <div class="col" align="center">
                                <q-card-section class="q-pt-none justify-center">
                                    <router-link :to="{ name: 'host_show_path', params: { id: space.id } }"><q-btn flat rounded
                                            color="primary" label="Show" /></router-link>
                                </q-card-section>
                            </div>
                        </div>
                    
                    </q-card>
                </GMapInfoWindow>
            </GMapMarker>
        </GMapMap>
    </q-page>
</template>
<script>
import "../store/index.js"
import { useStore } from "vuex"
import axios from "axios"
export default {
    created() {
        const store = useStore()
        const address = store.getters.getUserAddress
        axios.get(`http://localhost:3000/api/v1/maps/nearby/${address}`).then((response) => {
            this.nearby = response.data
        })
    },
    data() {
        return {
            openedMarkerID: null,
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
    setup() {


        const store = useStore()
        const center = { lat: store.getters.getLat, lng: store.getters.getLng }

        return {
            center,
        }
    },
    methods: {
        openMarker(id) {
            this.openedMarkerID = id
        }
    }
}
</script>
<style lang="">
    
</style>