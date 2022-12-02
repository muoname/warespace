<template>
                <div class="row justify-center flex-center q-pa-lg lt-md p-t">
                    <div class="col-6">
                        <registration_form></registration_form>
                    </div>
                </div>
                <div class="row justify-center flex-center q-pa-lg gt-sm p-t2">
                    <div class="col-4">
                        <registration_form></registration_form>
                    </div>
                </div>
</template>


<script>
import { useQuasar } from 'quasar'
import { ref } from 'vue'
import registration_form from './_registration_form.vue'

export default {
    components: {
        registration_form
    },

    setup() {

        return {
           
            }
        }
    }
    
</script>


<style>
</style>