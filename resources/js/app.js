/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./_helpers');
require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));


// importing toastr 
window.toastr = require('toastr');
window.toast = function toast(msg,type) {
    if(type==="success") toastr.success(msg);
    if(type==="error")   toastr.error(msg);
}

//import prism
window.Prism = require('../../public/css/plugins/prism/prism');

//Using Vue Plugins
import vue_resource from '../../node_modules/vue-resource/dist/vue-resource';
Vue.use(vue_resource);

import Loading from 'vue-loading-overlay';
Vue.use(Loading);

import VueProgressBar from 'vue-progressbar';
const options = {
    color:'#35495e',
    failedColor: 'red',
    thickness: '4px',
    transition: {
        speed: '0.2s',
        opacity: '0.6s',
        termination: 300
    },
    autoRevert: true,
    location: 'top',
    inverse: false,
    autoFinish:true,
}
Vue.use(VueProgressBar, options);


// registering global components
Vue.component('all_panels_in_admin', require('./admin_components/AllPanels.vue').default);
Vue.component('all_panels_in_home', require('./home_components/AllPanels.vue').default);


const app = new Vue({
    el: '#app',
});
