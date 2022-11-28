<template>
  <q-layout class="" view="lHh lpR lff">
    <Login v-model="prompt" />

    <q-header reveal bordered class="header-color text-white" height-hint="98">
      <div class="row justify-between flex-center">
        <div class="col-3 lt-md q-pl-md">
          <q-btn dense flat round icon="menu" @click="toggleLeftDrawer" />
        </div>
        <div class="col-3 gt-sm q-pl-md">
          <q-btn
            align="right"
            outline
            rounded
            label="LOG IN"
            icon="fa-regular fa-user"
            color="white"
            @click="prompt = true"
          />
        </div>
        <div class="col-3">
          <q-toolbar-title align="center">
            <q-btn flat color="white" href="/">
              <div class="row q-pb-sm">
                <img class="q-pt-sm logo-resize" src="../assets/logo-2.png" />
              </div>
            </q-btn>
          </q-toolbar-title>
        </div>
        <div class="q-pr-md col-3 vertical-middle" align="right">
          <q-input
            bg-color="white"
            outlined
            rounded
            dense
            v-model="text"
            label="Search"
          >
            <template v-slot:append>
              <div class="justtify-right flex-center">
                <q-icon name="search"> </q-icon>
              </div>
            </template>
          </q-input>
        </div>
      </div>

      <div class="row-inline justify-between flex-center gt-sm">
        <div class="col">
          <q-tabs v-model="tab" align="center">
            <q-tab name="home" icon="fa-solid fa-house" label="Home" href="/" />
            <q-tab name="map" icon="fa-solid fa-map" label="Map" />
            <q-tab name="shop" icon="fa-solid fa-shop" label="Browse" />
          </q-tabs>
        </div>
      </div>
    </q-header>

    <q-page-container>
      <q-page>
        <router-view />
        <div class="row text-h6 q-pa-lg header-color text-white">
          Check these recommendations!
        </div>
        <div clas="row-inline ">
          <Carousel_Card></Carousel_Card>
        </div>
      </q-page>
    </q-page-container>

    <q-drawer
      v-model="leftDrawerOpen"
      side="left"
      overlay
      elevated
      class="header-color"
    >
      <q-header reveal class="header-color text-white" height-hint="98">
        <div class="row justify-between flex-center">
          <div class="col-3 lt-md q-pt-sm q-pr-sm q-pb-sm q-pl-md">
            <q-btn
              dense
              flat
              round
              icon="fa-solid fa-x"
              @click="toggleLeftDrawer"
            />
          </div>
        </div>
        <div class="q-pl-md">
          <q-list padding class="menu-list">
            <q-item clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="fa-solid fa-house" href="/"></q-icon>
              </q-item-section>
              <q-item-section> Home </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="fa-solid fa-map"></q-icon>
              </q-item-section>
              <q-item-section> Map </q-item-section>
            </q-item>
            <q-item clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="fa-solid fa-shop"></q-icon>
              </q-item-section>
              <q-item-section> Browse </q-item-section>
            </q-item>
          </q-list>
        </div>
      </q-header>

      <q-footer class="dheader-color text-white">
        <div class="row flex-center q-pa-md">
          <div v-if="isLoggedIn" class="col justify-right">
            <q-btn flat color="white" @click="logoutUser" class="q-pa-xs">
              <div class="row items-center no-wrap">
                <q-icon left name="fa-solid fa-user" size="20px" />
                <div class="text-center">
                  LogOut Hello {{ this.getUserFirstName }}
                </div>
              </div>
            </q-btn>
          </div>
          <div v-else class="col justify-right">
            <q-btn flat color="white" @click="prompt = true" class="q-pa-xs">
              <div class="row items-center no-wrap">
                <q-icon left name="fa-solid fa-user" size="20px" />
                <div class="text-center">Log In {{ isLoggedIn }} </div>
              </div>
            </q-btn>
          </div>
        </div>
        <div class="row q-pl-lg q-pr-md q-pt-sm q-pb-sm">
          <a href="" class="text-white">About Us</a>
        </div>
      </q-footer>
    </q-drawer>

    <q-footer class="dheader-color text-white">
      <div class="row-inline dheader-color">
        <div
          class="col flex-center items-center text-h4 q-pa-lg text-white"
          align="center"
        >
          Subscribe to our Newsletter!

          <div class="row flex-center q-pt-md" align="center">
            <div class="col-3">
              <q-input
                bg-color="white"
                outlined
                rounded
                dense
                v-model="text"
                label="Email Address"
              >
                <template v-slot:append>
                  <div class="justtify-right flex center">
                    <q-icon name="email"> </q-icon>
                  </div>
                </template>
              </q-input>
            </div>
          </div>
        </div>
      </div>
      <div class="row justify-between dheader-color">
        <div class="col-3 text-h6 q-pa-lg text-white">
          <p class="text-h6" align="center">About Us</p>
        </div>
        <div class="col-3 text-h6 q-pa-lg text-white">
          <p class="text-h6" align="center">Browse</p>
        </div>
        <div class="col-3 q-pa-lg text-white">
          <p class="text-h6" align="center">Our Mission</p>
          <div class="col text-body-1">
            Be a part of creating an awesome space for new comers, hobbyists,
            and enthusiasts, who have the same affinity for custom mechanical
            keyboards.
          </div>
        </div>
      </div>
    </q-footer>

    <!-- <div class="row items-stretched">
            <div class="col-12 vertical-flex">
                <q-img class="col-12" src="/assets/bg-landing" fit="cover" />
            </div>
        </div> -->
  </q-layout>
</template>

<script>
import { ref } from "vue";
import Login from "../pages/shared/_login.vue";
import Carousel_Card from "../pages/shared/_carousel_card.vue";
import "../store";
import { mapActions, mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters([
      "getAuthToken",
      "getUserEmail",
      "getUserID",
      "isLoggedIn",
      "getUserFirstName",
    ]),
  },

  data() {
    return {
      loginEmail: "",
      loginPassword: "",
    };
  },

  methods: {
    ...mapActions(["loginUser", "logoutUser"]),
    onLogin(event) {
      event.preventDefault();
      let data = {
        user: {
          email: this.loginEmail,
          password: this.loginPassword,
        },
      };
      this.loginUser(data);
      this.resetData();
    },
  },

  components: {
    Login,
    Carousel_Card,
  },

  setup() {
    const leftDrawerOpen = ref(false);
    const testingTrue = ref(false);

    return {
      testingTrue,
      leftDrawerOpen,
      tab: ref("home"),
      prompt: ref(false),
      toggleLeftDrawer() {
        leftDrawerOpen.value = !leftDrawerOpen.value;
      },
    };
  },
};
</script>

<style lang="css">
.bg-image {
  background-image: url(/assets/bg-landing);
  background-repeat: no-repeat;
  background-size: contain;
}

.logo-resize {
  height: 35px;
  width: auto;
}

.header-opacity {
  opacity: 0.5;
}

.header-color {
  background: rgba(47, 84, 150);
}

.dheader-color {
  background: rgb(25, 51, 95);
}

.vertical-flex {
  flex: 1;
  display: flex;
  flex-direction: column;
}

html,
body,
#q-app,
.q-pa-md,
.full-stretch {
  height: 100%;
  width: 100%;
}

.icon_size {
  font-size: 1.4em;
}
</style>
