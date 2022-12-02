<template>
    <template v-if="isLoggedIn">
        <div v-if="statusExists">
            
        </div>
        <div class="row q-pa-lg text-h4 text-black justify-center">
            <div class="col-3 text-bold">
                Account <br>
                <q-btn flat color="black" icon="fa-solid fa-right-from-bracket" label="Logout" dense @click="logoutUser" /> <br>
                <q-btn v-if="isRenter" flat color="black" icon="fa-solid fa-repeat" label="Switch to Host" dense @click="switchUserType"/>
                <q-btn v-else flat color="black" icon="fa-solid fa-repeat" label="Switch to Renter" dense @click="switchUserType"/> <br>
        
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
                    User Type: <template v-if="isRenter"> Renter </template> <template v-else> Host </template>
                </p>
        
            </div>
            <div class="col-6">
        
                Listing History
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
            "getUserPhoneNumber"
        ]),
    },
    setup() {
        
    },
    methods: {
        ...mapActions(["loginUser", "logoutUser"]),

        switchUserType() {
            let self = this;
            axios.patch(`http://localhost:3000/users/${this.getUserID}`, {
                id: this.getUserID,
                is_renter: !this.isRenter
            }).then((response) => {
                this.$router.go()
                
            })
        }
        
    },
}
</script>
<style lang="">
    
</style>