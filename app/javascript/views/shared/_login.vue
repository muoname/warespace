<template >

  <q-dialog>
    <q-card style="min-width: 350px">
      <q-card-section>
        <div class="text-h6">Login</div>
      </q-card-section>
  
      <q-form @submit="onSubmit" class="q-gutter-md">
        <q-card-section class="q-pt-none">
          <q-input outlined v-model="email" type="text" autofocus label="Email" />
          <p></p>
          <q-input outlined v-model="password" type="password" label="Password" />
        </q-card-section>
        <q-card-section class="q-pt-none">
          <a href="/users/sign_up">Sign Up</a>
        </q-card-section>
        <q-card-actions align="right" class="text-primary">
          <q-btn color="primary" type="submit" label="Login" v-close-popup />
          <q-btn flat label="Cancel" v-close-popup />
        </q-card-actions>
        <div class="q-pb-xs"></div>
      </q-form>
    </q-card>
  </q-dialog>
</template>


<script>
import { ref } from 'vue'
import '../../store/store.js'
import { mapActions, mapGetters } from "vuex"

export default {
  computed: {
    ...mapGetters(["getAuthToken", "getUserEmail", "getUserID", "isLoggedIn", "getUserFirstName"])
  },

  data() {
    return {
      email: "",
      password: ""
    }
  },

  methods: {

    ...mapActions(["loginUser", "logoutUser"]),
    onSubmit(event) {
      event.preventDefault();
      let data = {
        user: {
          email: this.email,
          password: this.password,
        }
      };
      this.loginUser(data)
    },

  },
  
  setup(){
    return {
      email: ref(''),
      password: ref(''),
    }
  }
  
  
  
}
</script>

<style>
  
</style>