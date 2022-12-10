<template>
    <div class="row">
        <div class="col-5 q-pa-lg" align="center">
            <q-img
                
                :src="listing.image.url"
                style="width: 400px; height: auto "></q-img>
        </div>
        
        <div class="col-5 q-pl-sm q-pt-lg q-pb-lg q-pr-lg"> 
            <p class="text-h4 text-bold"> 
                {{ listing.title }}</p> 
            <p class="text-h6"> {{ listing.user_id }}</p> 
            <p class="text-body1"> <b>Address:</b> {{ listing.street}}, {{listing.city}}, {{listing.province}}, {{listing.zipcode}}</p> 
            <p class="text-body1"> {{ listing.description }}</p> 

            <div v-if="isRenter" class="vertical-bottom self-end">
                <q-form @submit="submitRent">
                    <q-date v-model="duration" minimal> </q-date>
                    <p></p>
                    <q-btn label="RENT" color="primary" type="submit"></q-btn>
                </q-form>
                
            </div>
        </div>
    </div>
</template>
<script>
import { ref } from "vue"
import axios from 'axios'
import "../../store";
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

        axios.get(`http://localhost:3000/api/v1/spaces/${this.$route.params.id}`).then((response) => {
            this.listing = response.data
            console.log(response.data)
            console.log(this.$route.params.id)
        })
    },
    data() {
        return{
            duration: ref(null),
            listing: []
        }
    },
    methods: {
        submitRent(){
            axios.post("http://localhost:3000/api/v1/rents/", {
                user_id: this.getUserID,
                duration: this.duration,
                space_id: this.$route.params.id
            })
        }
    }
}
</script>
<style>
    
</style>