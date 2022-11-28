<template>
    <Carousel class="lt-md p-t"></Carousel>
    <Carousel class="gt-sm p-t2"></Carousel>
</template>

<script>
import { ref } from 'vue'
import Carousel from "./_carousel.vue"
export default {
    components: {
        Carousel
    },

    setup() {
        return {
            slide: ref(1),
            autoplay: ref(true)
        }
    }
    
}
</script>

<style>

</style>