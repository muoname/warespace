<template>
    <div>
        <div class="row">
            <div class="col q-pa-sm">
                <div class="row flex-center float-right q-pr-lg q-pt-md">
                </div>
                <div class="row inline q-pb-xl q-pa-md">
                    <div v-for="space in spaces" v-bind:key="space.id" class="col-3 q-pa-sm">
                        <q-card class="">

                            <q-img :src="space.image.url" spinner-color="white" />

                            <q-card-section>
                                <div class="text-h6">{{ space.title }}</div>
                                <div class="text-subtitle2">{{ space.user.first_name }} {{ space.user.last_name }}</div>
                                <div class="text-body">{{ space.street }} {{ space.city }} {{ space.province }} {{
                                        space.zipcode
                                }}</div>
                                <div class="text-subtitle2"> Php: {{ space.weekly_rate }}</div>

                            </q-card-section>

                            <div class="row flex-center">
                                <div class="col" align="center">
                                    <q-card-section class="q-pt-none justify-center">
                                        <router-link :to="{ name: 'host_show_path', params: { id: space.id } }"><q-btn
                                                flat rounded color="primary" label="Show" /></router-link>
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
        console.log(this.$route.params.search_string)
        axios.post("http://localhost:3000/api/v1/search", {
            search_string: this.$route.params.search_string
        }).then((response) => {
            this.spaces = response.data;
        });
    },
    setup() {
        return {
            prompt: ref(false),
            prompt_delete: ref(false),
        };
    },
};
</script>
<style>

</style>
