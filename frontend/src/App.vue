<template>
  <router-view />
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'App',
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
