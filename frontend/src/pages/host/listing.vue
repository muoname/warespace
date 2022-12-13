<template>
  <div>
    <Space_Form v-model="prompt" />
    <delete_success v-model="prompt_delete" />
    <div class="row">
      <div class="col q-pa-sm">
        <div class="row flex-center float-right q-pr-lg q-pt-md">
          <q-btn v-if="(isLoggedIn && !isRenter)" rounded color="primary" icon="fa-solid fa-plus" label="New Listing"
            @click="prompt = true" />
        </div>
        <div class="row inline q-pb-xl q-pa-md">
          <div v-for="space in spaces" v-bind:key="space.id" class="col-3 q-pa-sm">
            <q-card class="">
    
              <q-img :src="space.image.url" spinner-color="white" />
    
              <q-card-section>
                <div class="text-h6">{{ space.title }}</div>
                <div class="text-subtitle2">{{ space.user.first_name }} {{ space.user.last_name }}</div>
                <div class="text-body">{{ space.street }} {{ space.city }} {{ space.province }} {{ space.zipcode }}</div>
                <div class="text-subtitle2"> Php: {{ space.weekly_rate }}</div>
    
              </q-card-section>
    
              <div class="row flex-center">
                <div class="col" align="center">
                  <q-card-section class="q-pt-none justify-center">
                    <router-link :to="{ name: 'host_show_path', params: { id: space.id } }"><q-btn flat rounded
                        color="primary" label="Show" /></router-link>
                  </q-card-section>
                </div>
              </div>
    
            </q-card>
          </div>
        </div>
      </div>
    </div>
  </div>
  
</template>
<script>
import axios from "axios";
import { ref } from "vue";
import Space_Form from "../shared/_space_form.vue";
import delete_success from "../shared/_space_form.vue";
import { mapActions, mapGetters } from "vuex";
export default {
  computed: {
    ...mapGetters([
      "getAuthToken",
      "getUserEmail",
      "getUserID",
      "isLoggedIn",
      "getUserFirstName",
      "isRenter"
    ]),
  },
  data() {
    
    return {
      spaces: [],
    };
  },
  created() {
    axios.get("http://localhost:3000/api/v1/spaces").then((response) => {
      this.spaces = response.data;
      console.log(this.spaces[0].image.url)
    });
  },
  setup() {
    return {
      prompt: ref(false),
      prompt_delete: ref(false),
    };
  },
  components: {
    Space_Form,
    delete_success,
  },
};
</script>
<style></style>
