<template>
  <Space_Form v-model="prompt" />
  <div class="row">
    <div class="col-4 q-pa-sm"></div>
    <div class="col-8 q-pa-sm">
      <div class="row flex-center float-right q-pr-lg q-pt-md">
        <q-btn v-if="(isLoggedIn && !isRenter)"
          rounded
          color="primary"
          icon="fa-solid fa-plus"
          label="New Listing"
          @click="prompt = true"
        />
      </div>
      <div class="row inline q-pa-md">
        <div
          v-for="space in spaces"
          v-bind:key="space.id"
          class="col-3 q-pa-sm"
        >
          <q-card v-ripple class="">
            <img src="https://cdn.quasar.dev/img/mountains.jpg" />

            <q-card-section>
              <div class="text-h6">{{ space.title }}</div>
              <div class="text-subtitle2">{{ space.user_id }}</div>
            </q-card-section>

            <q-card-section class="q-pt-none">
              <router-link
                :to="{ name: 'host_show_path', params: { id: space.id } }"
                ><q-btn flat rounded color="primary" label="Show"
              /></router-link>
            </q-card-section>
          </q-card>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import { ref } from "vue";
import Space_Form from "../shared/_space_form.vue";
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
    });
  },
  setup() {
    return {
      prompt: ref(false),
    };
  },
  components: {
    Space_Form,
  },
};
</script>
<style></style>
