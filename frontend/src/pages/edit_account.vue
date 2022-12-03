<template>
  <div class="row justify-center flex-center q-pa-xl lt-md">
    <div class="col-6">
      <edit_form></edit_form>
    </div>
  </div>
  <div class="row justify-center flex-center q-pa-xl gt-sm">
    <div class="col-4">
      <edit_form></edit_form>
    </div>
  </div>
</template>

<script>
import { useQuasar } from "quasar";
import { ref } from "vue";
import edit_form from "./_edit_form.vue";

export default {
  components: {
    edit_form,
  },

  setup() {
    return {};
  },
};
</script>

<style></style>
