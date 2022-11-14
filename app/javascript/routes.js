import { createWebHistory, createRouter } from 'vue-router'

import LandingPage from '@/views/shared/layout.vue';

const router = createRouter({
  routes: [
    { path: '/', component: LandingPage, name: 'root_path' },
    //{ path: '/pages', component: PageIndex, name: 'pages_path' },
    //{ .path: '/musicians', component: MusicianIndex, name: 'musicians_path' },
    //{ path: '/musicians/:id', component: MusicianShow, name: 'musician_path' },
    //{ path: '/404', component: Error404 },
    
    //{ path: '/:catchAll(.*)', redirect: '/404' }
  ]
});

export default router;