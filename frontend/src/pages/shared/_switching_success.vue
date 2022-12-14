<template>
    <q-dialog persistent>
        <q-card style="min-width: 350px">
            <q-card-section>
                <div class="text-h6" align="center">Status</div>
            </q-card-section>
            <div class="q-pa-lg">
                <q-card class="bg-positive q-pa-lg" align="center">
                    <p class="text-white" style="display:inline"> Successfully Switched! </p>
                </q-card>
            </div>
            <q-card-actions align="center" class="text-primary">
                <q-btn flat label="OK" @click="push" v-close-popup />
            </q-card-actions>
        </q-card>
    </q-dialog>
</template>
<script>
export default {
    methods: {
        push() {
            this.$router.push({name: "home_path"})
        }
    }
}
</script>
<style lang="">
    
</style>