<template>
    <div class="row justify-center flex center">
        <div class="col">
            <q-carousel animated v-model="slide" navigation infinite :autoplay="autoplay" arrows control-color="primary"
                transition-prev="slide-right" transition-next="slide-left" @mouseenter="autoplay = false"
                @mouseleave="autoplay = true">
                <q-carousel-slide :name="1">
                    <div class="row q-pa-md flex-center justify-between">
                        <div class="col-4 q-pl-lg q-pr-lg">
                            <Card class=""></Card>
                        </div>
                        <div class="col-4 q-pl-lg q-pr-lg">
                            <Card class=""></Card>
                        </div>
                        <div class="col-4 q-pl-lg q-pr-lg">
                            <Card class=""></Card>
                        </div>
                    </div>
                </q-carousel-slide>
                <q-carousel-slide :name="2">
                    <div class="row q-pa-md flex-center justify-between">
                        <div class="col-4 q-pl-lg q-pr-lg">
                            <Card class=""></Card>
                        </div>
                        <div class="col-4 q-pl-lg q-pr-lg">
                            <Card class=""></Card>
                        </div>
                        <div class="col-4 q-pl-lg q-pr-lg">
                            <Card class=""></Card>
                        </div>
                    </div>
                </q-carousel-slide>
            </q-carousel>
        </div>
    </div>
</template>

<script>
import { ref } from 'vue'
import Card from "./_card.vue"
export default {
    components: {
        Card
    },
    setup() {
        return {
            slide: ref(1),
            autoplay: ref(true),
        }
    }

}
</script>

<style>
</style>