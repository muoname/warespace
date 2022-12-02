<template>
    <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
        <q-input filled v-model="first_name" label="First Name" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter your First Name']" />
        <q-input filled v-model="last_name" label="Last Name" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter your Last Name']" />
        <q-input filled v-model="phone_number" label="Phone Number" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter your Phone Number']" />
        <q-input filled type="email" v-model="email" label="Email Address" lazy-rules
            :rules="[(val, rules) => rules.email(val) || 'Please enter a valid email address']" />
        <q-input filled type="password" v-model="password" label="Password" lazy-rules
            :rules="[val => val && val.length > 0 || 'Enter a Password']" />
    
        <q-toggle v-model="accept" label="I accept the license and terms" />
    
        <div>
            <q-btn label="Submit" type="submit" color="primary" />
        </div>
    </q-form>
</template>


<script>
import { useQuasar } from 'quasar'
import { ref } from 'vue'
import "../store/index.js";
import { mapActions, mapGetters } from "vuex";
export default {
    
    setup() {
        const first_name = ref(null)
        const last_name = ref(null)
        const phone_number = ref(null)
        const email = ref(null)
        const password = ref(null)
        const accept = ref(false)

        return {
            first_name,
            last_name,
            phone_number,
            email,
            password,
            accept,
        }
    },
    methods: {
        
        ...mapActions(["registerUser", "loginUser", "logoutUser"]),
        onSubmit(event) {
            event.preventDefault();
                let data = {
                    user: {
                        email: this.email,
                        password: this.password,
                        first_name: this.first_name,
                        last_name: this.last_name,
                        phone_number: this.phone_number,
                    },
                };
                this.registerUser(data);
            }
            
        },

}
</script>


<style>

</style>