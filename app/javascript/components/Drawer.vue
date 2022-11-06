<template>
        <q-drawer v-model="leftDrawerOpen" ref="leftDrawerOpen" side="left" overlay elevated class="header-color">
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
    
</template>


<script>
import { ref } from 'vue'

export default {
    props: {
        leftDrawerOpen: Boolean
    },
    setup() {
        const leftDrawerOpen = ref(false)
        return {   
            leftDrawerOpen,
            toggleLeftDrawer() {
                leftDrawerOpen.value = !leftDrawerOpen.value
            }
        }
        
    },
    data() {
        return {
            localLeftDrawerOpen: false
        }
        
    },
    watch: {
        leftDrawerOpen: function (newVal) {
            this.localLeftDrawerOpen = newVal;
        }
    },
    mounted: function() {
        this.localLeftDrawerOpen = this.leftDrawerOpen;
    }
}
</script>


<style lang="">
    
</style>