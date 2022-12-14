<template>
  <div class="row justify-center flex center">
    <div class="col">
      <q-carousel
        animated
        v-model="slide"
        navigation
        infinite
        :autoplay="autoplay"
        arrows
        transition-prev="slide-right"
        transition-next="slide-left"
        @mouseenter="autoplay = false"
        @mouseleave="autoplay = true"
      >
        <q-carousel-slide :name="1" img-src="../../assets/carousel-1.jpg">
          <div class="row q-pa-md flex-center justify-between">
            <div class="col-4 q-pl-xl">
              <q-card flat bordered class="my-card">
                <q-card-section>
                  <div class="text-h6">Find the Perfect Space</div>
                </q-card-section>

                <q-card-section class="q-pt-none">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                  do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                </q-card-section>

                <q-separator inset />

                <q-card-section>
                  <div class="row flex-center" align="center">
                    <q-btn
                      align="center"
                      rounded
                      label="Learn More"
                      color="primary"
                      @click="toLists"
                    />
                  </div>
                </q-card-section>
              </q-card>
            </div>
          </div>
        </q-carousel-slide>
        <q-carousel-slide :name="2" img-src="../../assets/carousel-2.jpg" />
        <q-carousel-slide :name="3" img-src="../../assets/carousel-3.jpg" />
        <q-carousel-slide :name="4" img-src="../../assets/carousel-4.jpg" />
      </q-carousel>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
export default {
  setup() {
    return {
      slide: ref(1),
      autoplay: ref(true),
    };
  },
  methods: {
    toLists(){
      this.$router.push({name: "listing_path"})
    }
  }
};
</script>

<style></style>
