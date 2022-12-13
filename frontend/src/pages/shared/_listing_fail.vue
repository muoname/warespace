<template>
    <q-dialog persistent>
        <q-card style="min-width: 350px">
            <q-card-section>
                <div class="text-h6" align="center">Status</div>
            </q-card-section>
            <div class="q-pa-lg">
                <q-card class="bg-negative q-pa-lg" align="center">
                    <p class="text-white" style="display:inline"> Please Check All Fields.. Listing Failed </p>
                </q-card>
            </div>
            <q-card-actions align="center" class="text-primary">
                <q-btn flat label="OK" v-close-popup @click="push"/>
            </q-card-actions>
        </q-card>
    </q-dialog>
</template>
<script>
export default {
    methods: {
        push(){ 
            this.$router.go()
        }
    }
}
</script>
<style lang="">
    
</style>