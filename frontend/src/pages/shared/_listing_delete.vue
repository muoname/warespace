<template>
    <q-dialog persistent>
        <q-card style="min-width: 350px">
            <q-card-section>
                <div class="text-h6" align="center">Status</div>
            </q-card-section>
            <div class="q-pa-lg">
                <q-card class="bg-positive q-pa-lg" align="center">
                    <p class="text-white" style="display:inline"> Delete Successful </p>
                </q-card>
            </div>
            <q-card-actions align="center" class="text-primary">
                <q-btn flat label="OK" v-close-popup />
            </q-card-actions>
        </q-card>
    </q-dialog>
</template>
<script>
export default {
}
</script>
<style lang="">
    
</style>