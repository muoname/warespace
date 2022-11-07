<template >

  <q-dialog>
    <q-card style="min-width: 350px">
      <q-card-section>
        <div class="text-h6">Login</div>
      </q-card-section>
  
      <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
        <q-card-section class="q-pt-none">
          <q-input outlined v-model="username" type="text" autofocus label="Username/Email" />
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
export default {
  
  setup(){
    return {
      username: ref(''),
      password: ref(''),
    }
  }
  
  
  
}
</script>

<style>
  
</style>