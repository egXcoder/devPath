/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

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
window.toast = function toast(msg) {
    toastr.success(msg);
}

//import prism
window.Prism = require('prismjs');

//Using Vue Plugins
import vue_resource from '../../node_modules/vue-resource/dist/vue-resource';
Vue.use(vue_resource);

// registering global components
Vue.component('all_panels', require('./components/AllPanels.vue').default);


//creating Shared to communicate between components
// export const Shared = new Vue();
