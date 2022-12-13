<template>
  <q-dialog>
    <listing_fail v-model="prompt_fail"></listing_fail>
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
            v-model="street"
            type="text"
            autofocus
            label="Street"
          />
          <p></p>
          <q-input
            outlined
            v-model="city"
            type="text"
            autofocus
            label="City"
          />
          <p></p>
          <q-input
            outlined
            v-model="zipcode"
            type="text"
            autofocus
            label="Zip Code"
          />
          <p></p>
          <q-input
            outlined
            v-model="province"
            type="text"
            autofocus
            label="Province"
          />
          <p></p>
          <q-input
            outlined
            v-model="description"
            type="textarea"
            autofocus
            label="Description"
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
          <p></p>
          <q-file v-model="image" label="Upload Image">
            <template v-slot:prepend>
              <q-icon name="attach_file" />
            </template>
          </q-file>
        </q-card-section>
        <q-card-actions align="right" class="text-primary">
            <q-btn color="primary" type="submit" label="Post Listing"/>

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
import listing_fail from "./_listing_fail.vue"
export default {
  components: {
    listing_fail,
  },
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
      description: "",
      space_size: "",
      weekly_rate: "",
      street: "",
      city: "",
      zipcode: "",
      province: "",
      image: ref(null)
    };
  },

  created() {
    axios
      .get("http://localhost:3000/api/v1/spacecategories")
      .then((response) => {
        this.categories = response.data;
      });
    axios.get("http://localhost:3000/api/v1/spaces/new").then((response) => {
      
    })
  },

  methods: {
    onSubmit(event) {
      event.preventDefault();
      const params = {
        user_id: this.getUserID,
        spacecategory_id: this.spacecategory_id,
        title: this.title,
        description: this.description,
        space_size: this.space_size,
        weekly_rate: this.weekly_rate,
        street: this.street,
        city: this.city,
        zipcode: this.zipcode,
        province: this.province,
        image: this.image
      }

      let formData = new FormData()
      Object.entries(params).forEach(
        ([key, value]) => formData.append(key, value)
      )

      new Promise((resolve, reject) => {
        axios.post("http://localhost:3000/api/v1/spaces", formData)
          .then((response) => {
            console.log(response.data)
            this.$router.push({ name: 'host_show_path', params: { id: response.data.id } })
            resolve(response);
            
          })
          .catch((error) => {
            reject(error);
            this.prompt_fail = true
          });
      });
    },
  },

  setup() {
    return {
      prompt_fail: ref(false), 
    };
  },
};
</script>

<style></style>
