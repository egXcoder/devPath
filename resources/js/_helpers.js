import Vue from 'vue';

//attach variables to global vue
Vue.prototype.$csrf = document.head.querySelector('meta[name="csrf-token"]').content;

window.getCookie = function (cookie) {
    var match = document.cookie.match(new RegExp('(^| )' + cookie + '=([^;]+)'));
    if (match) return match[2];
    return (match) ? match[2] : false;
}