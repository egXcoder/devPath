import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);

export default new Vuex.Store({
    state: {
        categories: [],
        categoryPanels: {}
    },
    getters: {
        panels(state) {
            return (category_name) => {
                return state.categoryPanels[category_name];
            }
        }
    },
    mutations: {
        setPanels(state, { category_name, panels }) {
            Vue.set(state.categoryPanels, category_name, panels);
        },
        setCategories(state, payload) {
            state.categories = payload;
        }
    },
    actions: {
        fetchPanels(context, category_name) {
            return window.axios.get(`/api/${category_name}/panels`).then((response) => {
                context.commit('setPanels', { category_name: category_name, panels: response.data.data });
            });
        },
        fetchCategories(context) {
            return window.axios.get(`/api/categories`).then((response) => {
                context.commit('setCategories', response.data.data);
            });
        }
    }
});