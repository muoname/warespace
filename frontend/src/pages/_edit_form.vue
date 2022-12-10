<template>
    <q-form @submit="onSubmit" class="">
        <q-input filled v-model="first_name" label="First Name" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter your First Name']" />
        <q-input filled v-model="last_name" label="Last Name" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter your Last Name']" />
        <q-input filled type="text-area" v-model="street" label="Street" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter your Street']" />
        <q-input filled type="text-area" v-model="city" label="City" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter your City']" />
        <q-input filled type="text-area" v-model="zipcode" label="Zip Code" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter your Zip Code']" />
        <q-input filled type="text-area" v-model="province" label="Province" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter your Province']" />
        <q-input filled v-model="phone_number" label="Phone Number" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter your Phone Number']" />
        <q-input filled type="email" v-model="email" label="Email Address" lazy-rules
            :rules="[(val, rules) => rules.email(val) || 'Please enter a valid email address']" />
        <q-input filled type="password" v-model="password" label="Password" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter a Password']" />

        <q-toggle v-model="accept" label="I accept the license and terms" />

        <div>
            <q-btn label="Edit Account Details" type="submit" color="primary" />

        </div>
    </q-form>
</template>


<script>
import { useQuasar } from 'quasar'
import { ref } from 'vue'
import "../store/index.js";
import { mapActions, mapGetters } from "vuex";
import axios from 'axios'
import { useStore } from 'vuex'
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
        
        const first_name = ref(null)
        const last_name = ref(null)
        const phone_number = ref(null)
        const email = ref(null)
        const password = ref(null)
        const street = ref(null)
        const city = ref(null)
        const zipcode = ref(null)
        const province = ref(null)
        const accept = ref(false)

        return {
            first_name,
            last_name,
            phone_number,
            email,
            password,
            accept,
            street,
            zipcode,
            city,
            province
        }
    },

    methods: {
        ...mapActions(["registerUser", "loginUser", "logoutUser"]),
        onSubmit() {
            let self = this;
            axios.patch(`http://localhost:3000/users/${this.getUserID}`, {
                id: this.getUserID,
                first_name: this.first_name,
                last_name: this.last_name,
                phone_number: this.phone_number,
                email: this.email,
                password: this.password,
                street: this.street,
                city: this.city,
                zipcode: this.zipcode,
                province: this.province
            }).then((response) => {
                this.$router.push({name: "account_path"})

            })
        },
        

    },

}
</script>


<style>

</style>