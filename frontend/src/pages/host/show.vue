<template>
    <div class="row">
        <div class="col-5 q-pa-lg" align="center">
            <q-img
                
                :src="listing.image.url"
                style="max-width: 1000px; height: auto ">
            </q-img>
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
            <div>
                <div class="q-pt-sm q-pb-sm">
                    <delete_fail v-model="delete_fail" />
                    <delete_success v-model="delete_success" />
                    <p class="text-h6"> Rent History:</p>
                    <div v-for="rent in rents" v-bind:key="rent.id" class="q-pb-sm">
                        <q-card>
                            <q-card-section>
                                <div class="text-body1"><b>Name of Renter:</b> {{ rent.user.first_name }} {{ rent.user.last_name}}</div>
                                <div class="text-body1"><b>Start Date</b> {{ rent.start_date }}</div>
                                <div class="text-body1"><b>End Date</b> {{ rent.end_date }}</div>
                            </q-card-section>
                            <q-card-actions align="center" class="text-primary" v-if="rent.user_id == getUserID">
                                <q-btn color="negative" @click="deleteRent(rent.id)" label="Delete Rent"/>
                            </q-card-actions>
                        </q-card>
                    </div>
                </div>
                <q-separator></q-separator>
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
import "../../store/index.js";
import { mapActions, mapGetters } from "vuex";
import rent_success from "../shared/_rent_sucess.vue"
import rent_fail from "../shared/_rent_fail.vue"
import delete_success from "../shared/_delete_sucess.vue"
import delete_fail from "../shared/_delete_fail.vue"
export default {
    components: {
        rent_success,
        rent_fail,
        delete_success,
        delete_fail,
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
            
            axios.delete(`http://localhost:3000/api/v1/spaces/${(this.listing.id)}`, {
            }).then((response) => {
                this.$router.push({name: "listing_path", props: {prompt_delete: true} })
            }).catch((error) =>{
                console.log(error)
                this.prompt_fail = true
            })
        },
        deleteRent(id){
            axios.delete(`http://localhost:3000/api/v1/rents/${id}`, {
            }).then((response) => {
                this.delete_success = true
            }).catch((error) =>{
                console.log(error)
                this.delete_fail = true
            })
        },
    },
    setup() {
        return {
            prompt_fail: ref(false),
            prompt_success: ref(false),
            delete_fail: ref(false),
            delete_success: ref(false),
        };
    },
}
</script>
<style>
    
</style>