<template>

    <q-layout class="" view="lHh lpR lFf">

        

        <Login v-model="prompt"/>

        <q-header reveal bordered class="header-color text-white" height-hint="98">
            <div class="row justify-between flex-center">
                <div class="col-3 lt-md q-pl-md">
                    <q-btn dense flat round icon="menu" @click="toggleLeftDrawer" />
                </div>
                <div class="col-3 gt-sm q-pl-md">
                    <q-btn align="right" outline rounded label="LOG IN" icon="fa-regular fa-user" color="white" @click="prompt = true" />
                </div>
                <div class="col-3">
                    <q-toolbar-title align="center">
                        <q-btn flat color="white" @click="">
                            <div class="row q-pb-sm">
                                <img class="q-pt-sm logo-resize" src="/assets/logo-2.png">
                            </div>
                        </q-btn>
                    </q-toolbar-title>
                </div>
                <div class="q-pr-md col-3 vertical-middle" align="right">
                    <q-input bg-color="white" outlined rounded dense v-model="text" label="Search">
                        <template v-slot:append>
                            <div class="justtify-right">
                                <q-icon name="search">
                                </q-icon>
                            </div>
                        </template>
                    </q-input>
                </div>
            </div>

            
            
            <div class="row-inline justify-between flex-center gt-sm">
                <div class="col">
                    <q-tabs v-model="tab" align="center">
                        <q-tab name="home" icon="fa-solid fa-house" label="Home" />
                        <q-tab name="map" icon="fa-solid fa-map" label="Map" />
                        <q-tab name="shop" icon="fa-solid fa-shop" label="Browse" />
                    </q-tabs>
                </div>
            </div>
            

        </q-header>

        <q-page-container>
            <q-page>
                <div class="row justify-between flex-center items-stretch">
                    <q-parallax height="600">
                        <template v-slot:media>
                            <img src="/assets/bg-landing.jpg">
                        </template>
                    </q-parallax>
                </div>
            </q-page>
        </q-page-container>

        <q-drawer v-model="leftDrawerOpen" side="left" overlay elevated class="header-color">
            <q-header reveal class="header-color text-white" height-hint="98">
                <div class="row justify-between flex-center">
                    <div class="col-3 lt-md q-pt-sm q-pr-sm q-pb-sm q-pl-md">
                        <q-btn dense flat round icon="fa-solid fa-x" @click="toggleLeftDrawer" />
                    </div>
                </div>
            </q-header>
        
            <q-footer class="bg-grey-8 text-white">
                <div class="row flex-center q-pa-md">
                    <div class="col justify-right">
                        <q-btn flat color="white" @click="prompt = true" class="q-pa-xs">
                            <div class="row items-center no-wrap">
                                <q-icon left name="fa-solid fa-user" size="20px" />
                                <div class="text-center">
                                    Log In
                                </div>
                            </div>
                        </q-btn>
                    </div>
                </div>
                <div class="row">
                    test
                </div>
            </q-footer>
        </q-drawer>

        <!-- <div class="row items-stretched">
            <div class="col-12 vertical-flex">
                <q-img class="col-12" src="/assets/bg-landing" fit="cover" />
            </div>
        </div> -->
        

    </q-layout>
</template>

<script>
import { ref } from 'vue'
import Login from './Login.vue'
import Drawer from './Drawer.vue'

export default {
    
    components: {
        Login,
        Drawer
    },

    setup() {
        const leftDrawerOpen = ref(false)

        return {
            leftDrawerOpen,
            tab: ref("home"),
            prompt: ref(false),
            toggleLeftDrawer() {
                leftDrawerOpen.value = !leftDrawerOpen.value
            }
        }
    }
}
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

    .vertical-flex {
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    html,body,#q-app,.q-pa-md,.full-stretch {
        height: 100%;
        width: 100%;
    }

    .icon_size {
        font-size: 1.4em;
    }

</style>