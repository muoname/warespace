<template>
    <div class="row justify-center flex-center q-pa-lg lt-md p-t">
        <div class="col-6">
            <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                <q-input filled v-model="first_name" label="First Name" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Enter your First Name']" />
                <q-input filled v-model="first_name" label="Last Name" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Enter your Last Name']" />
                <q-input filled v-model="phone_number" label="Phone Number" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Enter your Phone Number']" />
                <q-input filled type="email" v-model="email" label="Email Address" lazy-rules
                    :rules="[(val, rules) => rules.email(val) || 'Please enter a valid email address']" />
                <q-input filled type="password" v-model="password" label="Password" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Enter a Password']" />
                <q-input filled type="password" v-model="password_confirmation" label="Confirm Password" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Enter a Password']" />

                <q-toggle v-model="accept" label="I accept the license and terms" />

                <div>
                    <q-btn label="Submit" type="submit" color="primary" />
                    <q-btn label="Reset" type="reset" color="primary" flat class="q-ml-sm" />
                </div>
            </q-form>
        </div>
    </div>
    <div class="row justify-center flex-center q-pa-lg gt-sm p-t2">
        <div class="col-4">
            <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
                <q-input filled v-model="first_name" label="First Name" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Enter your First Name']" />
                <q-input filled v-model="first_name" label="Last Name" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Enter your Last Name']" />
                <q-input filled v-model="phone_number" label="Phone Number" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Enter your Phone Number']" />
                <q-input filled type="email" v-model="email" label="Email Address" lazy-rules
                    :rules="[(val, rules) => rules.email(val) || 'Please enter a valid email address']" />
                <q-input filled type="password" v-model="password" label="Password" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Enter a Password']" />
                <q-input filled type="password" v-model="password_confirmation" label="Confirm Password" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Enter a Password']" />

                <q-toggle v-model="accept" label="I accept the license and terms" />

                <div>
                    <q-btn label="Submit" type="submit" color="primary" />
                    <q-btn label="Reset" type="reset" color="primary" flat class="q-ml-sm" />
                </div>
            </q-form>
        </div>
    </div>
</template>


<script>
import { useQuasar } from 'quasar'
import { ref } from 'vue'
export default {
    setup() {
        const $q = useQuasar()
        const first_name = ref(null)
        const last_name = ref(null)
        const phone_number = ref(null)
        const email = ref(null)
        const password = ref(null)
        const password_confirmation = ref(null)
        const accept = ref(false)

        return {
            first_name,
            last_name,
            phone_number,
            email,
            password,
            password_confirmation,
            accept,

            onSubmit() {
                if (accept.value !== true) {
                    $q.notify({
                        color: 'red-5',
                        textColor: 'white',
                        icon: 'warning',
                        message: 'You need to accept the license and terms first'
                    })
                }
                else {
                    $q.notify({
                        color: 'green-4',
                        textColor: 'white',
                        icon: 'cloud_done',
                        message: 'Submitted'
                    })
                }
            },

            onReset() {
                first_name.value = null
                last_name.value = null
                phone_number.value = null
                email.value = null
                password.value = null
                password_confirmation.value = null
                accept.value = false

            }
        }
    }

}
</script>


<style>
.p-t {
    padding-top: 110px
}

.p-t2 {
    padding-top: 180px
}
</style>