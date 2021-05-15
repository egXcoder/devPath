import vue from 'vue';
import vuex from 'vuex';
vue.use(vuex);

export default new vuex.Store({
    state: {
        categoryPanels: {}
    },
    getters: {
        panels(state) {
            return (category_name) => {
                if (category_name && state.categoryPanels[category_name]) {
                    return state.categoryPanels[category_name].panels
                }
            }
        }
    },
    mutations: {
        setCategoryWithPanels(state, { category_name, categoryWithPanels }) {
            if (!category_name) {
                throw "Cant Update Panels as category name is missing";
            }

            state.categoryPanels[category_name] = categoryWithPanels;
            vue.set(state.categoryPanels, category_name, categoryWithPanels);
        },
        setCategories(state, payload) {
            for (let cat of payload) {
                if (!state.categoryPanels[cat.name]) {
                    vue.set(state.categoryPanels, cat.name, cat);
                }
            }
        }
    },
    actions: {
        fetchPanels(context, category_name) {
            if (!category_name) {
                throw "Can't fetch panels of empty category name";
            }

            return window.axios.get(`/api/${category_name}/panels`).then((response) => {
                context.commit('setCategoryWithPanels', { category_name: category_name, categoryWithPanels: response.data.data });
            });
        },
        fetchCategories(context) {
            return window.axios.get(`/api/categories`).then((response) => {
                context.commit('setCategories', response.data.data);
            });
        }
    }
});