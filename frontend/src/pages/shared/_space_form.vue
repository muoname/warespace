<template>
  <q-dialog>
    <q-card style="min-width: 350px">
      <q-card-section>
        <div class="text-h6">Login</div>
      </q-card-section>

      <q-form @submit="onSubmit" class="q-gutter-md">
        <q-card-section class="q-pt-none">
          <q-select
            outlined
            v-model="spacecategory_id"
            option-value="id"
            option-label="category_name"
            :options="categories"
            emit-value
            map-options
            label="Space Category"
          />
          <p></p>
          <q-input
            outlined
            v-model="title"
            type="text"
            autofocus
            label="Title"
          />
          <p></p>
          <q-input
            outlined
            v-model="location"
            type="textarea"
            autofocus
            label="Address"
          />
          <p></p>
          <q-input
            outlined
            v-model="description"
            type="textarea"
            autofocus
            label="Address"
          />
          <p></p>
          <q-input
            outlined
            v-model="space_size"
            type="text"
            autofocus
            label="Space Size"
          />
          <p></p>
          <q-input
            outlined
            v-model="weekly_rate"
            type="text"
            label="Weekly Rate"
          />
        </q-card-section>
        <q-card-actions align="right" class="text-primary">
            <q-btn color="primary" type="submit" label="Post Listing" v-close-popup />

          <q-btn flat label="Cancel" v-close-popup />
          
        </q-card-actions>
        <div class="q-pb-xs"></div>
      </q-form>
    </q-card>
  </q-dialog>
</template>

<script>
import { ref } from "vue";
import axios from "axios";
import "../../store";
import { mapActions, mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters([
      "getUserID",,
    ]),
  },

  data() {
    return {
      space: {},
      categories: {},
      space_id: "",
      spacecategory_id: "",
      title: "",
      location: "",
      description: "",
      space_size: "",
      weekly_rate: "",
    };
  },

  created() {
    axios
      .get("http://localhost:3000/api/v1/spacecategories")
      .then((response) => {
        this.categories = response.data;
      });
    axios.get("http://localhost:3000/api/v1/spaces/new").then((response) => {
      console.log(response.data)
    })
  },

  methods: {
    onSubmit(event) {
      event.preventDefault();
      new Promise((resolve, reject) => {
        axios.post("http://localhost:3000/api/v1/spaces", {
          user_id: this.getUserID,
          spacecategory_id: this.spacecategory_id,
          title: this.title,
          location: this.location,
          description: this.description,
          space_size: this.space_size,
          weekly_rate: this.weekly_rate,
        })
          .then((response) => {
            commit("setUserInfo", response);
            resolve(response);
          })
          .catch((error) => {
            reject(error);
          });
      });
    },
  },

  setup() {
    return {};
  },
};
</script>

<style></style>
