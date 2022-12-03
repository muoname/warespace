<template>
  <router-view />
</template>

<script>
import { defineComponent } from 'vue'
import "./store/index.js"
import { mapActions, mapGetters } from "vuex";
import { useStore } from 'vuex'
export default defineComponent({
  name: 'App',
  computed: {
    ...mapGetters([
      "getAuthToken",
      "getUserEmail",
      "getUserID",
      "isLoggedIn",
      "getUserFirstName",
      "getUserLastName",
      "isRenter",
      "getUserPhoneNumber",
      "getLat",
      "getLng",
    ]),
  },
  beforeCreate() {
    let localAuthToken = localStorage.auth_token;
    let cookieExists = localAuthToken !== "undefined" && localAuthToken !== null;
    if (cookieExists) {
      const auth_token = localStorage.getItem("auth_token");
      const authTokenExists = auth_token !== "undefined" && auth_token !== null;
      if (authTokenExists) {
        this.$store.dispatch("loginUserWithToken", { auth_token });
      }
    }
  },
})
</script>
