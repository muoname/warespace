<template>
    <template v-if="isLoggedIn">
        <div>
            
        </div>
        <div class="row q-pa-lg text-h4 text-black justify-center">
            <div class="col-3 text-bold">
                Account <br>
                <q-btn flat color="black" icon="fa-solid fa-right-from-bracket" label="Logout" dense
                    @click="logoutUser" /> <br>
                <q-btn v-if="isRenter" flat color="black" icon="fa-solid fa-repeat" label="Switch to Host" dense
                    @click="switchUserType" />
                <q-btn v-else flat color="black" icon="fa-solid fa-repeat" label="Switch to Renter" dense
                    @click="switchUserType" /> <br>

            </div>
            <div class="col-6">
            </div>
        </div>
        <div class="row q-pa-lg text-h5 text-black justify-center">
            <div class="col-3">


                <p class="text-weight-bold">Account Details</p>
                <p class="text-subtitle1">
                    Name: {{ getUserFirstName }} {{ getUserLastName }} <br>
                    Email: {{ getUserEmail }} <br>
                    Phone Number: {{ getUserPhoneNumber }} <br>
                    User Type: <template v-if="isRenter"> Renter </template> <template v-else> Host </template> <br>
                    <a href="/users/account/edit">Edit Account Details</a>
                </p>

            </div>
            <div v-if="isRenter" class="col-6">
                <p class="text-weight-bold q-pl-sm">My Rents</p>
                <div class="row">
                    <div v-for="listing in listings" v-bind:key="listing.id" class="col-5 q-pa-sm">
                        <q-card v-ripple class="">
                    
                            <q-img :src="listing" spinner-color="white" />
                    
                            <q-card-section>
                                <div class="text-h6">{{ listing.title }}</div>
                                <div class="text-subtitle2">{{ listing.user_id }}</div>
                            </q-card-section>
                    
                            <q-card-section class="q-pt-none">
                                <router-link :to="{ name: 'host_show_path', params: { id: listing.id } }"><q-btn flat rounded
                                        color="primary" label="Show" /></router-link>
                            </q-card-section>
                        </q-card>
                    </div>
                </div>
            </div>
            <div v-else class="col-6">
                <p class="text-weight-bold q-pl-sm">My Listings</p>
                <div class="row">
                    <div v-for="listing in listings" v-bind:key="listing.id" class="col-5 q-pa-sm">
                        <q-card v-ripple class="">
                    
                            <q-img :src="listing" spinner-color="white" />
                    
                            <q-card-section>
                                <div class="text-h6">{{ listing.title }}</div>
                                <div class="text-subtitle2">{{ listing.user_id }}</div>
                            </q-card-section>
                    
                            <q-card-section class="q-pt-none">
                                <router-link :to="{ name: 'host_show_path', params: { id: listing.id } }"><q-btn flat rounded color="primary"
                                        label="Show" /></router-link>
                            </q-card-section>
                        </q-card>
                    </div>
                </div>
            </div>
        </div>
    </template>
    <template v-else>
        <div>
            please login
        </div>
    </template>

</template>
<script>
import axios from 'axios'
import "../store";
import { mapActions, mapGetters } from "vuex";

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
        
        if(this.isRenter) {
            axios.post(`http://localhost:3000/api/v1/myspaces`, {
                search_id: this.getUserID
            }).then((response) => {
                this.listings = response.data
            })
        }
        else {
            axios.post(`http://localhost:3000/api/v1/myrents`, {
                search_id: this.getUserID
            }).then((response) => {
                this.rents = response.data
            })
        }

        
    },
    data(){
        return{
            listings: [],
            rents: []
        }
    },
    setup() {

    },
    methods: {
        ...mapActions(["loginUser", "logoutUser"]),

        switchUserType() {
            let self = this;
            axios.patch(`http://localhost:3000/users/switch/${this.getUserID}`, {
                id: this.getUserID,
                is_renter: !this.isRenter
            }).then((response) => {
                this.$router.go()
                this.$router.push({ name: "home_path" })
            })
        }

    },
}
</script>
<style lang="">
    
</style>