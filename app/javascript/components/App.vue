<template>

    <q-layout class="" view="hHh lpR fFf">
        <div class="row justify-between flex-center items-stretch">
            <q-parallax height="1500">
                <template v-slot:media>
                    <img src="/assets/bg-landing.jpg">
                </template>
                <q-page-container>
                    <q-page>
                        <q-dialog v-model="prompt" persistent>
                            <q-card style="min-width: 350px">
                                <q-card-section>
                                    <div class="text-h6">Login</div>
                                </q-card-section>
                
                                <q-card-section class="q-pt-none">
                                    <q-input outlined v-model="text" autofocus label="Username/Email" />
                                </q-card-section>
                                <q-card-section class="q-pt-none">
                                    <q-input outlined v-model="text" label="Password" />
                                </q-card-section>
                
                                <q-card-actions align="right" class="text-primary">
                                    <q-btn flat label="Login" v-close-popup />
                                    <q-btn flat label="Cancel" v-close-popup />
                                </q-card-actions>
                            </q-card>
                        </q-dialog>
                    </q-page>
                </q-page-container>
            </q-parallax>
        </div>

        <q-header reveal bordered class="header-color rounded-borders text-white" height-hint="98">
            <div class="row justify-between flex-center">
                <div class="col-3">
                    <q-btn dense flat round icon="menu" @click="toggleLeftDrawer" />
                </div>
                <div class="col-3">
                    <q-toolbar-title align="center">
                        <img class="q-pt-sm logo-resize" src="/assets/logo-2.png" href="/home">
                    </q-toolbar-title>
                </div>
                <div class="q-pr-xs col-3 vertical-middle" align="right">
                    <q-btn align="right" dense flat round icon="fa-solid fa-user" color="white" @click="prompt = true" />
                </div>
            </div>
        </q-header>

        
        

        

        <q-drawer v-model="leftDrawerOpen" side="left" overlay elevated>
            <!-- drawer content -->
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

export default {
    setup() {
        const leftDrawerOpen = ref(false)

        return {
            prompt: ref(false),

            leftDrawerOpen,
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
        background: rgba(47, 84, 150, 0.5);
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

</style>