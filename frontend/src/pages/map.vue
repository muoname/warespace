<template>
    <q-page v-if="isLoggedIn">
        <GMapMap :center="center" :options="options" :zoom="13" style="width: 100vw; height: 900px">
            <GMapMarker v-bind:key="space.id" v-for="space in nearby"
                :position="{ lat: space.latitude, lng: space.longitude }" @click="openMarker(space.id)">
                <GMapInfoWindow :closeclick="true" @closeclick="openMarker(null)" :opened="openedMarkerID === space.id" 
                :options="{
                    width: 200,
                    height: 200,
                }">
                    <q-card v-ripple class="">
                    
                        <q-img :src="space.image.url" spinner-color="white" />
                    
                        <q-card-section>
                            <div class="text-h6">{{ space.title }}</div>
                            <div class="text-subtitle2">{{ space.user.first_name }} {{ space.user.last_name }}</div>
                            <div class="text-body">{{ space.street }} {{ space.city }} {{ space.province }} {{ space.zipcode }}</div>
                            <div class="text-subtitle2"> Php: {{ space.weekly_rate }}</div>
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
    <template v-else>
        <q-card style="min-width: 350px">
            <q-card-section>
                <div class="text-h6" align="center">Status</div>
            </q-card-section>
            <div class="q-pa-lg">
                <q-card class="bg-negative q-pa-lg" align="center">
                    <p class="text-white" style="display:inline"> Please Login to Continue in this Page </p>
                </q-card>
            </div>
            <q-card-actions align="center" class="text-primary">
                <q-btn flat label="OK" @click="push" v-close-popup />
            </q-card-actions>
        </q-card>
    </template>
</template>
<script>
import "../store/index.js"
import { mapActions, mapGetters } from "vuex";
import { useStore } from "vuex"
import axios from "axios"
export default {
    computed: {
        ...mapGetters([
            "getAuthToken",
            "getUserEmail",
            "getUserID",
            "isLoggedIn",
            "getUserFirstName",
            "getUserLastName",
            "isRenter",
            "getUserPhoneNumber",
        ]),
    },
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
        },
        push(){
            this.$router.push({name:"home_path"})
        }
    }
}
</script>
<style lang="">
    
</style>