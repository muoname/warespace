<template>
        <q-page>
                <GMapMap :center="center" :zoom="10" style="width: 100vw; height: 900px" />
        </q-page>
</template>
<script>
export default {
    setup(){
        const center = { lat: 51.093048, lng: 6.84212 }
        return {
            center
        }
    }
}
</script>
<style lang="">
    
</style>