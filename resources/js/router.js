import Vue from 'vue';
import VueRouter from 'vue-router';
Vue.use(VueRouter);

import HomePanels from './home_components/AllPanels.vue'
import AdminPanels from './admin_components/AllPanels.vue'

export default new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/:category',
            component: HomePanels
        },
        {
            path: '/admin/:category',
            component: AdminPanels
        },
    ]
})