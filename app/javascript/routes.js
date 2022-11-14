import { createRouter, createWebHistory  } from 'vue-router'

import LandingPage from "./views/shared/landing.vue"
import Registration from "./views/shared/registration.vue"
import Error404 from "./views/pages/404.vue"

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: LandingPage, name: 'root_path' },
    { path: '/users/sign_up', component: Registration, name: 'registration_path' },
    { path: '/404', component: Error404 },
    //{ path: '/pages', component: PageIndex, name: 'pages_path' },
    //{ path: '/musicians', component: MusicianIndex, name: 'musicians_path' },
    //{ path: '/musicians/:id', component: MusicianShow, name: 'musician_path' },
   // { path: '/404', component: Error404 },
    
   { path: '/:catchAll(.*)', redirect: '/404' }
  ]
});

export default router;