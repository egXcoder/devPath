import Vue from 'vue';
import VueRouter from 'vue-router';
Vue.use(VueRouter);

import HomeIndex from './home_components/index.vue';
import HomePanels from './home_components/AllPanels.vue';
import AdminIndex from './admin_components/index.vue';
import AdminPanels from './admin_components/AllPanels.vue';
import NotFound from './global_components/NotFound.vue';

export default new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/',
            redirect: '/home',
        },
        {
            path: '/home',
            component: HomeIndex
        },
        {
            path: '/home/:category',
            component: HomePanels
        },
        {
            path: '/admin/',
            component: AdminIndex
        },
        {
            path: '/admin/:category',
            component: AdminPanels
        },
        {
            path: '*',
            component: NotFound,
        }
    ]
})