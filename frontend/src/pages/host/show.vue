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
            <p class="text-h6"> {{ listing.user.first_name }} {{ listing.user.last_name }} </p> 
            <p class="text-body1"> <b>Price:</b> Php {{ listing.weekly_rate }} per week</p> 
            <p class="text-body1"> <b>Address:</b> {{ listing.street}}, {{listing.city}}, {{listing.province}}, {{listing.zipcode}}</p> 
            <p class="text-body1"> <b>Contact Number:</b> {{ listing.user.phone_number}} </p> 
            <p class="text-body1"> <b>Host Address:</b> {{ listing.user.address}} </p> 

            <q-separator></q-separator>
            <p class="text-body1 q-pt-sm"> {{ listing.description }}</p> 
            <q-separator></q-separator>
            
            

            <div v-if="isRenter && (getUserID != listing.user_id)" class="vertical-bottom self-end q-pt-md">
                <rent_fail v-model="prompt_fail" />
                <rent_success v-model="prompt_success" />
                <p class="text-body1"> Choose start and end date </p>
                <q-form @submit="submitRent">
                    <q-date v-model="duration" minimal range> </q-date>
                    <p></p>
                    <q-btn label="RENT" color="primary" type="submit"></q-btn>
                    
                </q-form>
                
            </div>
            <div v-if="getUserID == listing.user_id" class="q-pt-md">
                <q-btn class="" label="Delete Listing" color="negative" @click="onDelete"></q-btn>
            </div>
        </div>
    </div>
</template>
<script>
import { ref } from "vue"
import axios from 'axios'
import "../../store";
import { mapActions, mapGetters } from "vuex";
import rent_success from "../shared/_rent_sucess.vue"
import rent_fail from "../shared/_rent_fail.vue"
export default {
    components: {
        rent_success,
        rent_fail,
    },
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
        })
        axios.get(`http://localhost:3000/api/v1/show_rents/${this.$route.params.id}`).then((response) => {
            this.rents = response.data
            console.log(this.rents)
        })

    },
    data() {
        return{
            duration: ref(null),
            listing: [],
            rents: []
        }
    },
    methods: {
        submitRent(){
            console.log(this.duration)
            axios.post("http://localhost:3000/api/v1/rents/", {
                user_id: this.getUserID,
                start_date: this.duration.from,
                end_date: this.duration.to,
                space_id: this.$route.params.id
            }).then((response) => {
                this.prompt_success = true
            }).catch((error) =>{
                console.log(error)
                this.prompt_fail = true
            })
        },
        onDelete(){
            console.log(this.duration)
            axios.delete(`http://localhost:3000/api/v1/spaces/${(this.listing.id)}`, {
            }).then((response) => {
                this.$router.push({name: "listing_path", props: {prompt_delete: true} })
            }).catch((error) =>{
                console.log(error)
                this.prompt_fail = true
            })
        },
    },
    setup() {
        return {
            prompt_fail: ref(false),
            prompt_success: ref(false),
        };
    },
}
</script>
<style>
    
</style>